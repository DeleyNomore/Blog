# 项目 AI 协作说明（Hugo + PaperMod）

本仓库是一个使用 Hugo 与 PaperMod 主题的静态博客站点。目标：让 AI 代理在不了解背景的情况下，也能立即完成常见开发任务（写作、预览、构建、样式调整、主题配置、部署）。

> 最近已对齐示例站点的常用功能（Archive/Search/Tags/WiKi、首页介绍与社交图标）。下文新增了快速操作清单与排错提示。

## 架构与目录要点
- 站点生成器：Hugo（需使用 PaperMod 要求的版本，README 标注 min Hugo >= v0.146.0）。
- 主题：`themes/PaperMod/`（上游文档详见其 README 与 Wiki）。避免直接改主题源码，优先通过站点层的覆盖与扩展实现定制。
- 站点配置：`hugo.yaml`
   关键字段：`baseURL: '/'`（使用相对链接，CI 环境覆盖）、`languageCode: zh-cn`、`title: DeleyNomore`、`theme: ["PaperMod"]`、`params.*` 按示例站点启用功能（面包屑/目录/复制按钮等）。
   首页介绍：在 `hugo.yaml` 的 `params.homeInfoParams` 写入友好文案（示例已内置，包含导航提示与 WiKi/仓库链接）。
- 内容：`content/`（文章与页面应放在这里）。
        - name: WiKi
          url: https://github.com/DeleyNomore/Blog/wiki
- 资源：`assets/`（用以管道化打包/指纹/压缩的资源）。
- 参考示例：工作区中还有一个独立示例站点 `hugo-PaperMod/`，其中 `assets/css/extended/custom.css` 展示了 PaperMod 的样式扩展方式，可作为本项目定制的参考，但与本站点分离管理。

### 功能对齐示例站点（快速操作）
- 顶部菜单：在 `hugo.yaml` 增加
  ```yaml
  menu:
    main:
      - name: Archive
        url: archives/
        weight: 10
      - name: Search
        url: search/
        weight: 20
      - name: Tags
        url: tags/
        weight: 30
      - name: WiKi
        url: https://github.com/adityatelange/hugo-PaperMod/wiki
        weight: 40
  ```
- 首页介绍：在 `hugo.yaml` 的 `params.homeInfoParams` 写入示例文案（PaperMod’s Demo + 介绍段落）。
- 社交图标：在 `hugo.yaml` 的 `params.socialIcons` 增加 `github/discord/x/buymeacoffee` 等链接。
- 页面文件：创建
  - `content/archives.md`
    ```yaml
    ---
    title: "Archive"
    layout: "archives"
    url: "/archives/"
    summary: "Archive"
    ---
    ```
  - `content/search.md`
    ```yaml
    ---
    title: "Search"
    layout: "search"
    url: "/search/"
    summary: "search"
    ---
    ```
- 搜索数据源：确保 `hugo.yaml` 的 `outputs.home` 包含 `JSON`，示例：
  ```yaml
  outputs:
    home:
      - HTML
      - RSS
      - JSON
  ```
- Tags/Archive：
  - Tags 页自动生成；文章需在 Front Matter 写 `tags: [tag1, tag2]` 才会展示。
  - 归档页依赖上面的 `archives.md` 与 `ShowAllPagesInArchive: true`。

内容来源迁移：工作区 `blog/` 的 Markdown 已通过脚本迁移到 `content/posts/`（见下文“迁移脚本”）。后续新增文章请直接在 `content/posts/` 维护。

## 开发与运行（Windows PowerShell）
- 本地预览（含草稿）：
  - `hugo server -D`
  - 访问提示的本地地址，自动热更新。
- 构建发布（本地，如需）：
  - 清理：`Remove-Item -Recurse -Force public`（如需）
  - 构建：`hugo -D` 或 `hugo --minify`
  - 输出：`public/`（CI/CD 中自动生成，不建议提交）。

### 常见排错
- 顶部菜单不显示：确认 `menu.main` 已配置且 `url` 正确；本地刷新或重启服务。
- Search 空白：确保 `content/search.md` 存在，`outputs.home` 含 `JSON`，无 404；清理 `public/` 后重建。
- Tags 无内容：文章是否包含 `tags`；草稿需 `hugo server -D` 才显示。

## 部署（CI/CD）
- GitHub Pages：已配置工作流 `/.github/workflows/hugo-pages.yml`，推送到 `main`/`master` 触发。
  - 关键步骤：`actions/checkout@v4` → `peaceiris/actions-hugo@v2`（extended、Hugo>=0.146.0）→ `hugo --minify` → `actions/upload-pages-artifact` → `actions/deploy-pages`。
  - 链接策略：依赖 `relativeURLs` 生成相对链接，避免不同域名导致的 canonical 问题。
- Netlify：`netlify.toml` 已配置，生产环境固定 `HUGO_VERSION=0.146.0`；构建命令 `hugo --gc --minify -b $DEPLOY_PRIME_URL`。
  - 部署入口：在 Netlify 绑定该仓库或指向该目录后自动生效。

> 说明：PaperMod 要求 min Hugo >= v0.146.0（extended）。CI 已按此配置。

## 内容创作工作流
- 新建文章：
  - `hugo new posts/my-post.md`
  - 将使用 `archetypes/default.md` 的 Front Matter：
    - `date`: 自动时间
    - `draft`: true（草稿，发布前改为 false 或用 `-D` 预览）
    - `title`: 由文件名生成（`-` 转空格并 `Title` 化）
- 常见 Front Matter（按 PaperMod 支持能力选用）：`description`, `tags`, `categories`, `cover`, `showToc`, `hideMeta` 等。具体字段请参考 `themes/PaperMod/README.md` 与主题 Wiki。

## 迁移脚本（blog → content/posts）
- 路径：`scripts/migrate-blog.ps1`
- 用途：将工作区 `blog/` 目录下的 Markdown 迁移至 `content/posts/`，并在无 Front Matter 时自动补齐基础 Front Matter。
- 用法（PowerShell）：
  - 直接运行：`& "$(Resolve-Path ./scripts/migrate-blog.ps1)"`
  - 可选参数：`-SourceRoot <blog绝对路径> -TargetRoot <content/posts绝对路径>`
- 规则：
  - 默认以 `blog/` 的一级目录名作为 `categories`。
  - 已含 Front Matter 的文件保持原样拷贝；无 Front Matter 的文件自动填充 `title`/`date`/`draft:false`。

## 样式与主题定制
- 推荐通过站点层扩展而非改动主题：
  - 新建：`assets/css/extended/custom.css`（PaperMod 会自动合并扩展）
  - 可参考示例站点 `hugo-PaperMod/assets/css/extended/custom.css` 的写法。
- 多语言与 i18n：主题已在 `themes/PaperMod/i18n/` 提供多语资源。站点可在根级 `i18n/` 目录放置同名文件进行覆盖。

## 约定与最佳实践（本仓库特有）
- 不直接编辑 `public/`；任何改动应源自 `content/`、`layouts/`、`assets/`、`hugo.yaml` 或 data/i18n。
- `public/` 与 `resources/`、`.netlify/` 已在 `.gitignore` 忽略；采用 CI/CD 构建与部署。
- 主题更新策略：主题在 `themes/PaperMod/` 内，若需升级请遵循上游 README 指引，测试后再构建。
- `hugo.yaml` 采用示例站点风格配置；如需多语言、菜单等，请参考 `hugo-PaperMod/config.yml` 与主题 Wiki。

## 典型任务示例
- 新建并预览一篇草稿：
  1) `hugo new posts/first-post.md`
  2) 填写内容，保持 `draft: true`
  3) 运行 `hugo server -D` 并在浏览器查看
- 添加全站样式：创建 `assets/css/extended/custom.css`，写入自定义 CSS，重启/刷新本地服务即可生效。

---
仍需维护者确认/补充：
- GitHub 仓库：https://github.com/DeleyNomore/Blog
- GitHub Pages 类型与 baseURL：
  - 使用“用户/组织页”时：目标为 `https://deleynomore.github.io/`，在 CI 中覆盖 `--baseURL https://deleynomore.github.io/`。
  - 使用“项目页”时：目标为 `https://deleynomore.github.io/Blog/`，在 CI 中覆盖 `--baseURL https://deleynomore.github.io/Blog/`。
- 自定义域名（如启用）：完成 DNS 指向后，在 CI 中覆盖 `--baseURL https://<你的域名>/`；并在仓库 Pages 设置里填写该域名。可选：在 `static/CNAME` 写入域名。
- Netlify：已使用 `hugo --gc --minify -b $DEPLOY_PRIME_URL`。若上线固定域名，可改为 `-b https://<你的域名>/` 或设置环境变量覆盖。
- 社交链接（已在 `hugo.yaml` 配置）：
  - GitHub：`https://github.com/DeleyNomore/Blog`
  - X：`https://x.com/Deley_Nomor`
  - Discord：`https://discord.gg/QYUzcyd3`
  - Ko‑fi：`https://ko-fi.com/deleynomore`
- 可选集成：Analytics/评论（如 Google Analytics、Umami、Disqus、Giscus）待确认后再配置。