---
applyTo: '**'
---

# Hugo PaperMod 项目指令文档

## 项目概述
- 项目：使用 Hugo + PaperMod 主题的静态博客
- 仓库：DeleyNomore/Blog
- 主题：PaperMod (git 子模块)
- 语言：中文 (zh-cn)

## 核心配置文件路径
- **站点配置**: `hugo.yaml`
- **文章目录**: `content/posts/`
- **主题目录**: `themes/PaperMod/`
- **自定义样式**: `assets/css/extended/custom.css`
- **归档页面**: `content/archives.md`
- **搜索页面**: `content/search.md`
- **部署工作流**: `.github/workflows/hugo-pages.yml`
- **Netlify 配置**: `netlify.toml`

## 关键配置要点
- **Hugo 版本**: v0.152.2 (extended) - 项目当前使用版本，高于 PaperMod 最低要求 v0.146.0
- **主题配置**: `theme: ["PaperMod"]`
- **基础 URL**: `baseURL: "/"` (相对链接)
- **语言代码**: `languageCode: zh-cn`
- **菜单配置**: 已配置文章/分类/搜索/标签/WiKi 导航
- **搜索功能**: 依赖 `outputs.home` 包含 `JSON` 格式
- **Front Matter**: categories 使用数组格式 `["分类名"]`

## 开发工作流
- **新建文章**: `hugo new posts/my-post.md` (使用草稿模式)
- **本地预览**: `hugo server -D` (包含草稿)
- **构建站点**: `hugo -D` 或 `hugo --minify`
- **清理输出**: `Remove-Item -Recurse -Force public`

## 部署流程
- **GitHub Pages**: 推送至 `main` 分支自动触发部署，使用项目当前的 Hugo 版本 v0.152.2
- **Netlify**: 自动部署，为确保环境一致性，建议使用与本地相同的 Hugo 版本

## 重要约定和规则
- **禁止修改**: 不得直接修改 `themes/PaperMod/` 源码
- **定制方式**: 通过覆盖模板或站点层配置实现定制
- **文件路径**: 菜单链接使用相对路径如 `/categories/`
- **输出目录**: 不提交 `public/` 目录，由 CI/CD 生成
- **Front Matter**: tags 使用数组格式 `tags: [tag1, tag2]`

## 模板覆盖规则
- 要覆盖主题模板，复制 `themes/papermod/layouts/` 下的文件到 `layouts/` 对应目录
- Hugo 会优先使用站点层的模板文件

## 故障排除
- **菜单不显示**: 检查 `menu.main` 配置和 URL 正确性
- **搜索空白**: 确认 `content/search.md` 存在且 `outputs.home` 包含 JSON
- **标签无内容**: 检查文章是否包含 `tags` 字段，草稿需 `-D` 参数预览
