param(
    [string]$SourceRoot,
    [string]$TargetRoot
)

# Resolve defaults based on repo layout
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$siteRoot = Resolve-Path (Join-Path $scriptDir "..")
$repoRoot = Resolve-Path (Join-Path $siteRoot "..")

if (-not $SourceRoot -or [string]::IsNullOrWhiteSpace($SourceRoot)) {
    $defaultSource = Join-Path $repoRoot "blog"
    if (Test-Path $defaultSource) { $SourceRoot = (Resolve-Path $defaultSource).Path }
}
if (-not $TargetRoot -or [string]::IsNullOrWhiteSpace($TargetRoot)) {
    $defaultTarget = Join-Path $siteRoot "content\posts"
    if (Test-Path (Split-Path $defaultTarget -Parent)) { $TargetRoot = (Resolve-Path $defaultTarget).Path }
}

if (-not (Test-Path $SourceRoot)) { throw "SourceRoot not found: $SourceRoot" }
if (-not (Test-Path $TargetRoot)) { New-Item -ItemType Directory -Force -Path $TargetRoot | Out-Null }

Write-Host "Migrating content" -ForegroundColor Cyan
Write-Host "  From: $SourceRoot"
Write-Host "  To  : $TargetRoot"

function Test-HasFrontMatter {
    param([string]$FilePath)
    try {
        # Read first non-empty meaningful line
        $lines = Get-Content -Path $FilePath -TotalCount 10 -ErrorAction Stop
        foreach ($l in $lines) {
            if ($null -ne $l -and $l.Trim().Length -gt 0) {
                $t = $l.Trim()
                if ($t -eq '---' -or $t -eq '+++') { return $true }
                return $false
            }
        }
        return $false
    } catch {
        return $false
    }
}

function New-YamlFrontMatter {
    param(
        [string]$Title,
        [DateTime]$Date,
        [string]$Category
    )
    $safeTitle = $Title.Replace('"','\"')
    $dateStr = $Date.ToString('yyyy-MM-ddTHH:mm:ssK')

    $yaml = @()
    $yaml += '---'
    # PowerShell requires backtick escaping for quotes inside double-quoted strings
    $yaml += "title: `"$safeTitle`""
    $yaml += "date: $dateStr"
    $yaml += 'draft: false'
    if ($Category -and $Category.Trim().Length -gt 0) {
        # Quote category if it contains spaces or non-ascii chars (safe anyway)
        $catQuoted = '"' + $Category.Replace('"','\"') + '"'
        $yaml += "categories: [$catQuoted]"
    }
    $yaml += '---'
    return ($yaml -join [Environment]::NewLine) + [Environment]::NewLine + [Environment]::NewLine
}

function Get-RelPath {
    param(
        [string]$Base,
        [string]$Full
    )
    # Prefer .NET API when available
    try {
        if ([System.IO.Path]::GetRelativePath) {
            $rp = [System.IO.Path]::GetRelativePath($Base, $Full)
            return ($rp -replace '^[\\/]+','')
        }
    } catch {}
    # Fallback: simple prefix strip
    $rel = $Full
    if ($Full.StartsWith($Base,[System.StringComparison]::OrdinalIgnoreCase)) {
        $rel = $Full.Substring($Base.Length)
    }
    return ($rel -replace '^[\\/]+','')
}

$allFiles = Get-ChildItem -Path $SourceRoot -Recurse -Force -File | Where-Object {
    # Exclude VCS and app-specific hidden folders
    ($_.FullName -notmatch '(\\|/)\.git(\\|/|$)') -and
    ($_.FullName -notmatch '(\\|/)\.hg(\\|/|$)') -and
    ($_.FullName -notmatch '(\\|/)\.svn(\\|/|$)') -and
    ($_.FullName -notmatch '(\\|/)\.obsidian(\\|/|$)')
}

[int]$total = 0
[int]$copied = 0
[int]$converted = 0

foreach ($f in $allFiles) {
    $total++
    # Compute relative path (normalize separators)
    $rel = Get-RelPath -Base $SourceRoot -Full $f.FullName
    $dest = Join-Path $TargetRoot $rel
    $destDir = Split-Path $dest -Parent
    if (-not (Test-Path $destDir)) { New-Item -ItemType Directory -Force -Path $destDir | Out-Null }

    if ($f.Extension -ieq '.md') {
        $hasFM = Test-HasFrontMatter -FilePath $f.FullName
        if ($hasFM) {
            Copy-Item -LiteralPath $f.FullName -Destination $dest -Force
            $copied++
        } else {
            # Build Front Matter
            $baseName = [System.IO.Path]::GetFileNameWithoutExtension($f.Name)
            $title = ($baseName -replace '[_-]+',' ') -replace '\s+',' '
            # First-level directory under SourceRoot as category
            $parts = ($rel -split '[\\/]') | Where-Object { $_ -ne '' }
            $category = if ($parts.Count -gt 1) { $parts[0] } else { $null }
            $fm = New-YamlFrontMatter -Title $title -Date $f.LastWriteTime -Category $category
            # Read as UTF8 explicitly to avoid mojibake on PS5 when source lacks BOM
            try {
                $body = [System.Text.Encoding]::UTF8.GetString([System.IO.File]::ReadAllBytes($f.FullName))
            } catch {
                $body = Get-Content -LiteralPath $f.FullName -Raw
            }
            $out = $fm + $body
            $out | Set-Content -LiteralPath $dest -Encoding utf8
            $converted++
        }
    } else {
        # Non-markdown assets: copy as-is
        Copy-Item -LiteralPath $f.FullName -Destination $dest -Force
        $copied++
    }
}

Write-Host "Done. Total: $total | Copied: $copied | Added FM: $converted" -ForegroundColor Green
