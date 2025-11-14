# Blog

## 项目概述

这是一个基于 Hugo 静态站点生成器和 PaperMod 主题构建的个人博客。项目采用现代化的静态站点架构，支持 Markdown 内容创作、分类归档、标签系统、全文搜索等功能。

## 项目结构

```
📂 .
├── 📂 archetypes              # 文章模板目录
├── 📂 assets                  # 静态资源目录（CSS、JS等）
│   └── 📂 css/extended        # 自定义样式扩展
├── 📂 content                 # 内容目录（核心）
│   ├── 📄 archives.md         # 归档页面配置
│   ├── 📄 search.md           # 搜索页面配置
│   └── 📂 posts               # 文章内容目录（按分类组织）
│       ├── 📂 DevOps
│       ├── 📂 Docker
│       ├── 📂 Js
│       ├── 📂 Linux
│       ├── 📂 Mysql
│       ├── 📂 Shell
│       └── 📂 Windows
├── 📂 data                    # 数据文件目录（用于动态内容）
├── 📄 hugo.yaml               # Hugo 站点主配置文件
├── 📂 i18n                    # 国际化配置目录
├── 📂 layouts                 # 自定义布局模板
│   ├── 📂 _default            # 默认布局
│   └── 📂 partials            # 页面组件片段
├── 📄 LICENSE                 # 开源许可证
├── 📄 netlify.toml            # Netlify 部署配置
├── 📂 public                  # 生成的静态站点（构建产物，通常不提交到版本控制）
├── 📄 README.md               # 项目说明文档
├── 📂 scripts                 # 辅助脚本目录
│   └── 📄 migrate-blog.ps1    # 博客内容迁移脚本
├── 📂 static                  # 静态文件目录（直接复制到 public）
└── 📂 themes                  # 主题目录
    └── 📂 PaperMod            # PaperMod 主题（作为 git 子模块）
```

## 目录详解

### 核心目录

- **`content/`**: 博客的核心内容目录，所有 Markdown 文章都存放在此。`posts/` 子目录按技术分类组织文章，便于管理和浏览。

- **`themes/PaperMod/`**: Hugo PaperMod 主题目录，作为 git 子模块引入。**注意：不要直接修改此目录下的文件**，自定义应通过站点层的覆盖机制实现。

- **`assets/`**: Hugo 资源管道目录，用于处理和优化 CSS、JS 等静态资源。自定义样式应放在 `assets/css/extended/custom.css`。

- **`layouts/`**: 自定义页面布局模板。当前项目在此目录下覆盖了归档页面和文章元信息的显示方式。

### 配置文件

- **`hugo.yaml`**: Hugo 站点的主配置文件，包含站点基本信息、主题设置、菜单配置、功能开关等。

- **`archetypes/default.md`**: 新文章的默认模板，使用 `hugo new` 命令创建文章时会基于此模板。

- **`netlify.toml`**: Netlify 平台的部署配置文件，定义构建命令和环境变量。

### 辅助目录

- **`scripts/`**: 包含博客维护脚本，如内容迁移脚本 `migrate-blog.ps1`。

- **`data/` 和 `i18n/`**: 分别用于存储结构化数据和国际化翻译文件。

- **`static/`**: 存放不需要 Hugo 处理的静态文件，如 favicon、robots.txt 等。

### 构建产物

- **`public/`**: Hugo 构建生成的静态站点目录，包含所有 HTML、CSS、JS 文件。此目录通常添加到 `.gitignore`，由 CI/CD 在部署时自动生成。

## 开发与部署

- **本地预览**: 运行 `hugo server -D` 启动本地开发服务器
- **构建站点**: 运行 `hugo --minify` 生成优化后的静态站点
- **部署**: 通过 GitHub Actions 或 Netlify 自动部署到线上环境