# AI指令：Hugo项目资源文件处理规则

此文档为AI定义了在本项目中处理本地资源文件（包括图片、文档等）的统一规则，以确保链接在本地开发和线上构建后都能正确解析。

## 核心原则

所有本地资源（图片、CSV、PDF等）都应与引用它们的Markdown文章放在相邻的目录结构中。AI的任务是根据资源类型将文件放置到正确的子目录，并使用正确的相对路径进行引用。

Hugo的自定义模板 (`render-image.html` 和 `render-link.html`) 会自动处理路径转换。

---

## 规则 1：图片资源 (.png, .jpg, .gif, .webp等)

- **存放位置**：必须存放在与文章 `index.md` 或 `_index.md` 文件同级的 **`images`** 子目录中。
- **Markdown 语法**：在Markdown中，必须使用相对于 `images` 目录的路径。

- **示例**：
  - 文件物理路径：`content/posts/My-Awesome-Post/images/cover.png`
  - Markdown中的引用：`![这是一个封面](images/cover.png)`

**AI操作流程**：当用户要求插入图片时，将图片文件保存到上述 `images` 目录，并在Markdown中插入对应的链接。

---

## 规则 2：其他资源文件 (.csv, .pdf, .zip, .docx等)

- **存放位置**：必须存放在与文章 `index.md` 或 `_index.md` 文件同级的 **`res`** 子目录中。
- **Markdown 语法**：在Markdown中，必须使用相对于 `res` 目录的路径。

- **示例**：
  - 文件物理路径：`content/posts/My-Data-Analysis/res/dataset.csv`
  - Markdown中的引用：`[下载数据集](res/dataset.csv)`

**AI操作流程**：当用户要求添加可下载文件或其他非图片资源时，将文件保存到上述 `res` 目录，并在Markdown中插入对应的链接。

---

## 总结

- **图片** -> 存放在 `images/` 目录，链接为 `images/filename.ext`。
- **其他资源** -> 存放在 `res/` 目录，链接为 `res/filename.ext`。
- **禁止使用** `../` 或绝对路径。AI应始终使用从 `images/` 或 `res/` 开始的相对路径。
