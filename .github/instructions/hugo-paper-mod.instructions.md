---
applyTo: '**'
---

# Hugo PaperMod 参考资料汇总

## 官方文档链接

## 本地文档资料库
- [Hugo 官方文档 (离线版)](file:///F:/HostWork/Github.Workspace/GO/hugo/docs) - 包含 Hugo 官方文档的本地离线版本
- [PaperMod 主题文档 (离线版)](file:///D:/Users/SuSuSoo/Documents/Obsidian/hugo-PaperMod.wiki) - 包含 PaperMod 主题文档的本地离线版本
- [Hugo 主题示例站点 (离线版)](file:///D:/Users/SuSuSoo/Documents/Obsidian/hugo-PaperMod) - 包含 Hugo PaperMod 主题的示例站点源码

### PaperMod Wiki
- [PaperMod Features](https://github.com/adityatelange/hugo-PaperMod/wiki/Features) - PaperMod 功能特性文档
- [PaperMod FAQs](https://github.com/adityatelange/hugo-PaperMod/wiki/FAQs) - 常见问题解答
- [PaperMod Installation](https://github.com/adityatelange/hugo-PaperMod/wiki/Installation) - 安装指南
- [PaperMod Variables](https://github.com/adityatelange/hugo-PaperMod/wiki/Variables) - 配置变量说明

### Hugo 官方文档
- [Hugo Taxonomies](https://gohugo.io/content-management/taxonomies/) - Hugo 分类系统文档
- [Hugo Menus](https://gohugo.io/content-management/menus/) - Hugo 菜单系统文档
- [Hugo Configuration](https://gohugo.io/getting-started/configuration/) - Hugo 配置文档

## 本地项目文件路径

### 当前项目 (hugo-blog)
- **配置文件**: `d:\Users\SuSuSoo\Documents\Obsidian\hugo-blog\hugo.yaml`
- **文章目录**: `d:\Users\SuSuSoo\Documents\Obsidian\hugo-blog\content\posts\`
- **主题目录**: `d:\Users\SuSuSoo\Documents\Obsidian\hugo-blog\themes\PaperMod\`
- **自定义样式**: `d:\Users\SuSuSoo\Documents\Obsidian\hugo-blog\assets\css\extended\custom.css`
- **归档页面**: `d:\Users\SuSuSoo\Documents\Obsidian\hugo-blog\content\archives.md`
- **搜索页面**: `d:\Users\SuSuSoo\Documents\Obsidian\hugo-blog\content\search.md`

### 示例站点 (hugo-PaperMod)
- **配置文件**: `d:\Users\SuSuSoo\Documents\Obsidian\hugo-PaperMod\config.yml`
- **内容目录**: `d:\Users\SuSuSoo\Documents\Obsidian\hugo-PaperMod\content\`
- **主题目录**: `d:\Users\SuSuSoo\Documents\Obsidian\hugo-PaperMod\themes\hugo-PaperMod\`

### Github Pages 工作流示例文件
- ** github pages hugo 模版 **: `D:\Users\SuSuSoo\Documents\Obsidian\hugo-blog\.github\workflows\hugo.tpl`
- ** hugo PaperMod 示例站点工作流 **: `D:\Users\SuSuSoo\Documents\Obsidian\hugo-PaperMod\.github\workflows\gh-pages.yml`

## 覆盖主题模板

借助 Hugo 的查找顺序，您可以覆盖主题中的任意部分。以下是一个简单示例。

假设您希望调整 `list` 模板的样式。只需复制主题中的 `list` 模板文件：

```shell
your-site/themes/papermod/layouts/_defaults/list.html
```

并将其粘贴到您站点的 `layouts` 目录下：

```shell
your-site/layouts/_defaults/list.html
```

此时您便可自由修改 `list` 模板。
当 Hugo 构建站点时，系统将优先使用您创建的 `list.html` 文件，而非主题中的原始文件。

## 注意事项

- **不要修改主题源码**: `themes/PaperMod/` 是 git 子模块，应通过站点层配置实现定制
- **Hugo 版本要求**: PaperMod 要求 Hugo >= v0.146.0
- **Front Matter 格式**: categories 应为数组格式 `["分类名"]`
- **菜单链接**: 使用相对路径 `/categories/` 而不是绝对路径