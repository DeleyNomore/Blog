---
applyTo: '**'
---

# Hugo 图片保存规则

此文档定义了在 Hugo + PaperMod 项目中通过 VS Code 粘贴图片时应遵循的规则。

## 存放位置
- **页面相关图片**：使用 Page Bundle，保存到 `${fileDirname}/images/` 目录
- **全站公共图片**：保存到 `static/images/` 目录

## 命名规范
- **自动生成**：使用时间戳格式 `${datetime|yyyyMMdd_HHmmss}` (如：`20251127_120530.png`)
- **手动命名**：公共图片使用语义名称 (如：`logo.png`, `icon-social-twitter.svg`)

## 引用方式
- **Page Bundle 图片**：`![](images/图片文件名.png)`
- **公共图片**：`![](/images/图片文件名.png)` (static 目录内容通过根路径引用)

## VS Code 配置
- 自动将图片保存到当前文件同级的 `images` 目录
- 使用时间戳命名避免重复
- 配置文件：`.vscode/settings.json`
