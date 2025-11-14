# 项目 AI 协作说明（Hugo + PaperMod）

本仓库是一个使用 Hugo 与 PaperMod 主题的静态博客站点。目标：让 AI 代理在不了解背景的情况下，也能立即完成常见开发任务（写作、预览、构建、样式调整、主题配置等）。

## 架构与目录要点
- 站点生成器：Hugo（需使用 PaperMod 要求的版本，README 标注 min Hugo >= v0.146.0）。
- 主题：`themes/PaperMod/`（上游文档详见其 README 与 Wiki）。避免直接改主题源码，优先通过站点层的覆盖与扩展实现定制。
- 站点配置：`hugo.yaml`
  - 当前：`baseURL`, `languageCode`, `title`, `theme`（`["PaperMod"]`）。
- 内容：`content/`（文章与页面应放在这里）。
- 原型/脚手架：`archetypes/default.md`（新建内容时默认 Front Matter：`date`, `draft`, `title`）。
- 产物目录：`public/`（构建输出，勿手改）。
- 资源：`assets/`（用以管道化打包/指纹/压缩的资源）。
- 参考示例：工作区中还有一个独立示例站点 `hugo-PaperMod/`，其中 `assets/css/extended/custom.css` 展示了 PaperMod 的样式扩展方式，可作为本项目定制的参考，但与本站点分离管理。

注意：工作区还有 `blog/`（包含大量 Markdown）。当前 `hugo.yaml` 未指向该目录，默认 Hugo 只读取本仓库 `content/`。若需将 `blog/` 文章纳入发布，请维护者确认计划（复制/同步/设置 contentDir 等）。

## 开发与运行（Windows PowerShell）
- 本地预览（含草稿）：
  - `hugo server -D`
  - 访问提示的本地地址，自动热更新。
- 构建发布（含草稿）：
  - 清理：`Remove-Item -Recurse -Force public`（如需）
  - 构建：`hugo -D`（或 `hugo --minify` 进行压缩）
  - 输出：`public/`（静态文件，部署到任意静态托管）。

## 内容创作工作流
- 新建文章：
  - `hugo new posts/my-post.md`
  - 将使用 `archetypes/default.md` 的 Front Matter：
    - `date`: 自动时间
    - `draft`: true（草稿，发布前改为 false 或用 `-D` 预览）
    - `title`: 由文件名生成（`-` 转空格并 `Title` 化）
- 常见 Front Matter（按 PaperMod 支持能力选用）：`description`, `tags`, `categories`, `cover`, `showToc`, `hideMeta` 等。具体字段请参考 `themes/PaperMod/README.md` 与主题 Wiki。

## 样式与主题定制
- 推荐通过站点层扩展而非改动主题：
  - 新建：`assets/css/extended/custom.css`（PaperMod 会自动合并扩展）
  - 可参考示例站点 `hugo-PaperMod/assets/css/extended/custom.css` 的写法。
- 多语言与 i18n：主题已在 `themes/PaperMod/i18n/` 提供多语资源。站点可在根级 `i18n/` 目录放置同名文件进行覆盖。

## 约定与最佳实践（本仓库特有）
- 不直接编辑 `public/`；任何改动应源自 `content/`、`layouts/`、`assets/`、`hugo.yaml` 或 data/i18n。
- 主题更新策略：主题在 `themes/PaperMod/` 内，若需升级请遵循上游 README 指引，测试后再构建。
- 基础配置：请及时将 `hugo.yaml` 的 `baseURL` 与 `languageCode` 改为实际站点信息，避免产出错误链接。

## 典型任务示例
- 新建并预览一篇草稿：
  1) `hugo new posts/first-post.md`
  2) 填写内容，保持 `draft: true`
  3) 运行 `hugo server -D` 并在浏览器查看
- 添加全站样式：创建 `assets/css/extended/custom.css`，写入自定义 CSS，重启/刷新本地服务即可生效。