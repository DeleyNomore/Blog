---
title: "Visual Studio 2022 安装到非系统盘完全指南"
date: 2025-11-14T08:22:46+08:00
draft: false
categories: ["Windows"]
tags: ["windows", "visual studio", "安装", "非系统盘", "教程"]
slug: "visual-studio-2022-installation-complete-guide-to-non-system-drive"
---

Visual Studio 是一款功能强大但庞大臃肿的集成开发环境，
尽管在安装 Visual Studio 时可以选择安装位置，
但无论如何更改安装位置，仍然会有许多组件安装到 C 盘上。
本文将详细介绍将 Visual Studio 安装到非 C 盘的步骤，
使您能够更灵活地管理您的开发环境。

#### 第一步：创建安装目录的符号链接

符号链接是一种特殊的文件或目录，
它们在操作系统中起到类似快捷方式的作用，可以指向其他位置。
在 Windows 系统中，我们可以使用 mklink 命令创建符号链接。
现在，让我们利用 mklink 命令来替换 Visual Studio 的安装目录，
以便将其安装到我们所期望的位置。

Visual Studio 2022 安装主要涉及到以下目录：

> C:\Program Files (x86)\Microsoft SDKs
> C:\Program Files (x86)\Microsoft Visual Studio
> C:\Program Files (x86)\Windows Kits
> C:\Program Files\Microsoft SDKs
> C:\Program Files\Microsoft Visual Studio
> C:\Program Files\Windows Kits
> C:\ProgramData\Microsoft\VisualStudio
> C:\ProgramData\Package Cache

我们首先在目标位置创建所需的目录结构 (假设你想安装在 E 盘)：

```cmd
mkdir "E:\Program Files (x86)\Microsoft SDKs"
mkdir "E:\Program Files (x86)\Microsoft Visual Studio"
mkdir "E:\Program Files (x86)\Windows Kits"
mkdir "E:\Program Files\Microsoft SDKs"
mkdir "E:\Program Files\Microsoft Visual Studio"
mkdir "E:\Program Files\Windows Kits"
mkdir "E:\ProgramData\Microsoft\VisualStudio"
mkdir "E:\ProgramData\Package Cache"
```

然后拷贝 C 盘现有文件到 E 盘对应目录 (包括权限和属性)：

```cmd
Xcopy "C:\Program Files (x86)\Microsoft SDKs" "E:\Program Files (x86)\Microsoft SDKs" /E /H /C /I /K /O /X /Y
Xcopy "C:\Program Files (x86)\Microsoft Visual Studio" "E:\Program Files (x86)\Microsoft Visual Studio" /E /H /C /I /K /O /X /Y
Xcopy "C:\Program Files (x86)\Windows Kits" "E:\Program Files (x86)\Windows Kits" /E /H /C /I /K /O /X /Y
Xcopy "C:\Program Files\Microsoft SDKs" "E:\Program Files\Microsoft SDKs" /E /H /C /I /K /O /X /Y
Xcopy "C:\Program Files\Microsoft Visual Studio" "E:\Program Files\Microsoft Visual Studio" /E /H /C /I /K /O /X /Y
Xcopy "C:\Program Files\Windows Kits" "E:\Program Files\Windows Kits" /E /H /C /I /K /O /X /Y
Xcopy "C:\ProgramData\Microsoft\VisualStudio" "E:\ProgramData\Microsoft\VisualStudio" /E /H /C /I /K /O /X /Y
Xcopy "C:\ProgramData\Package Cache" "E:\ProgramData\Package Cache" /E /H /C /I /K /O /X /Y
```

接着删除 C 盘相关的目录 (否则在下一步创建软连接时可能会因目录已存在而报错):

```cmd
rmdir "C:\Program Files (x86)\Microsoft SDKs" /S/Q
rmdir "C:\Program Files (x86)\Microsoft Visual Studio" /S/Q
rmdir "C:\Program Files (x86)\Windows Kits" /S/Q
rmdir "C:\Program Files\Microsoft SDKs" /S/Q
rmdir "C:\Program Files\Microsoft Visual Studio" /S/Q
rmdir "C:\Program Files\Windows Kits" /S/Q
rmdir "C:\ProgramData\Microsoft\VisualStudio" /S/Q
rmdir "C:\ProgramData\Package Cache" /S/Q
```

最后使用 mklink 命令创建对应目录软链接：

```cmd
mklink /J "C:\Program Files (x86)\Microsoft SDKs" "E:\Program Files (x86)\Microsoft SDKs"
mklink /J "C:\Program Files (x86)\Microsoft Visual Studio" "E:\Program Files (x86)\Microsoft Visual Studio"
mklink /J "C:\Program Files (x86)\Windows Kits" "E:\Program Files (x86)\Windows Kits"
mklink /J "C:\Program Files\Microsoft SDKs" "E:\Program Files\Microsoft SDKs"
mklink /J "C:\Program Files\Microsoft Visual Studio" "E:\Program Files\Microsoft Visual Studio"
mklink /J "C:\Program Files\Windows Kits" "E:\Program Files\Windows Kits"
mklink /J "C:\ProgramData\Microsoft\VisualStudio" "E:\ProgramData\Microsoft\VisualStudio"
mklink /J "C:\ProgramData\Package Cache" "E:\ProgramData\Package Cache"
```

#### 第二步：安装 Visual Studio

您可以前往 Visual Studio 官网下载安装程序，并选择所需的组件。
在安装过程中，无需修改安装位置，按照正常流程进行安装即可。
安装完成后，您将会在符号链接所指向的位置中找到 Visual Studio 的安装文件，
这意味着您已成功将其安装到非 C 盘位置上。

------------------------------------------------------------------

Visual Studio 下载地址：https://visualstudio.microsoft.com/zh-hans/

