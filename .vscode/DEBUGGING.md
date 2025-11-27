# Hugo 项目开发配置

## 项目概述

这是一个基于 Hugo 静态站点生成器和 PaperMod 主题构建的个人博客项目。本项目已配置了 VS Code 任务，用于开发和构建 Hugo 站点。

## 任务配置说明

由于 Hugo 是一个命令行工具，而不是传统的可调试程序，因此我们使用 VS Code 的任务系统来运行 Hugo 命令。

### 可用任务

以下任务已配置在 `tasks.json` 文件中：

1. **Hugo Server with Drafts** - 启动 Hugo 服务器，包含草稿文章
2. **Hugo Server Production** - 启动 Hugo 服务器，不包含草稿文章
3. **Hugo Build Site** - 构建生产版本的站点
4. **Hugo Build Site with Drafts** - 构建包含草稿文章的站点

### 如何运行任务

1. **使用命令面板**：
   - 按 `Ctrl+Shift+P` 打开命令面板
   - 输入 "Tasks: Run Task"
   - 选择要运行的任务

2. **使用快捷键**：
   - 按 `Ctrl+Shift+P`，然后输入 "Tasks: Run Build Task"（默认构建任务）
   - 或者在终端中直接运行 `hugo server -D` 等命令

3. **设置默认任务**：
   - 按 `Ctrl+Shift+P`，输入 "Tasks: Configure Default Build Task"
   - 选择 "Hugo Server with Drafts" 作为默认任务
   - 然后可以使用 `Ctrl+Shift+B` 快捷键运行

### 任务详情

- **Hugo Server with Drafts**: `hugo server -D`
  - 启动开发服务器，包含草稿文章
  - 自动热重载，适合开发阶段

- **Hugo Server Production**: `hugo server`
  - 启动开发服务器，不包含草稿文章
  - 自动热重载

- **Hugo Build Site**: `hugo --minify`
  - 构建生产版本的站点
  - 包含 CSS/JS 压缩

- **Hugo Build Site with Drafts**: `hugo -D --minify`
  - 构建包含草稿文章的生产版本
  - 包含 CSS/JS 压缩

## 推荐工作流程

1. **开发阶段**：
   - 运行 "Hugo Server with Drafts" 任务
   - 在浏览器中访问 http://localhost:1313

2. **构建部署**：
   - 运行 "Hugo Build Site" 任务
   - 检查 `public/` 目录中的输出文件

## 推荐扩展

为了获得更好的 Hugo 开发体验，建议安装以下扩展：

- Hugo shortcode support
- VSCode JSON support
- PowerShell (如果使用 Windows)
- Auto Rename Tag
- VSCode Task Launcher (用于快速启动任务)

这些扩展已配置在 `extensions.json` 文件中，VSCode 会提示您安装。

## F5 调试配置

虽然 Hugo 本身不需要传统意义上的调试，但您可以配置 VSCode 以使用 F5 键启动开发服务器：

1. 打开命令面板 (`Ctrl+Shift+P`)
2. 输入 "Tasks: Configure Default Build Task"
3. 选择 "Hugo Server with Drafts"
4. 现在您可以使用 `Ctrl+Shift+B` 来启动 Hugo 服务器

## 注意事项

- 确保系统已安装 Hugo 扩展版本（extended version）
- 项目使用 PaperMod 主题，位于 `themes/PaperMod/` 目录
- 自定义样式应放在 `assets/css/extended/custom.css`
- 文章内容位于 `content/posts/` 目录
- 本地开发时使用 `hugo server -D` 命令可预览草稿文章