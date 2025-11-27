# Markdown Paste

智能 Markdown 粘贴。

**支持 Mac/Windows/Linux！**。

![Markdown paste demo](./res/images/markdown_paste_demo_min.gif)

## 系统要求

- Linux 系统需要 `xclip` 命令
- Windows 系统需要 `powershell` 命令
- Mac 系统需要 `pbpaste` 命令

## 功能特性

- 智能粘贴

  在 Markdown 中按下 'Ctrl+Alt+V'（Mac 上为 'Cmd+Alt+V'）或使用 `Markdown Paste` 命令进行智能粘贴。

  - 如果粘贴的是图片，扩展会为图片创建一个新文件，并将链接代码插入到 Markdown 中（在 SSH 和 Dev Container 模式下禁用）。
  - 如果粘贴的是文本，它会使用自定义正则表达式测试文本，并用正则表达式替换匹配的内容。
  - 如果粘贴的是包含 HTML 标签的文本，它会尝试将 HTML 内容转换为 Markdown。
  - 如果粘贴的是富文本，它会尝试将富文本转换为 Markdown。
    ![](./res/images/markdown-paste-rich-text-html-table.gif)

- 下载文件

  使用 `Markdown Download` 命令（Linux 或 Windows：`Ctrl+Alt+D`，Mac：`Cmd+Alt+D`）下载文件并将链接代码插入到 Markdown 中。
  ![](./res/images/markdown-paste-download-gif-demo.gif)

- 粘贴代码

  使用 `Markdown Paste Code` 命令（Linux 或 Windows：`Ctrl+Alt+C`，Mac：`Cmd+Alt+C`）粘贴代码并自动检测语言。

- Ruby 标签

  另外，如果你想写学习中文或日文等亚洲语言的文章，ruby 标签（例如：<ruby>聪明<rp>(</rp><rt>Cōngmíng</rt><rp>)</rp></ruby>）可能很有用。现在为你准备了一个 ruby 标签片段，选择一些文本并按 'Ctrl+Alt+T'。

  ```HTML
  <ruby>聪明<rp>(</rp><rt>发音</rt><rp>)</rp></ruby>
  ```

  此版本不会为你获取发音。你必须自己替换 '发音' 部分。

- 插入 LaTeX 数学符号和表情符号

  你可以在任何文本文件中插入 LaTeX 数学符号和表情符号，例如 Julia 源文件。

  按 'Ctrl+Alt+\' 或在 vscode 命令面板中输入 "Insert latex math symbol"，然后输入 LaTeX 符号名称并选择你想要的符号。

  ![](res/images/insert-math-symbol-2018-08-12-18-15-12.png)

- 嵌入 base64 图片

  当你粘贴图片或下载图片时，你可以通过留空文件名来强制扩展将嵌入的 base64 图片插入到 markdown 中。

  ![](res/images/insert_embed_base64_image.gif)

- AI 解析剪贴板

  使用 LLM AI 解析 `text` 或 `HTML` 剪贴板内容。你还可以通过使用 AI 配置自定义 AI 剪贴板解析行为，以更好地适应不同的用例。

## 配置

- 预定义变量

  - `${workspaceRoot}` 或 `${workspaceFolder}` - 在 VS Code 中打开的文件夹路径
  - `${workspaceFolderBasename}` - 在 VS Code 中打开的文件夹名称，不带任何斜杠 (/)
  - `${fileWorkspaceFolder}` - 当前打开文件的工作区文件夹
  - `${file}` 或 `${filePath}` - 当前打开的文件
  - `${relativeFileDirname}` - 当前打开文件相对于 `$fileWorkspaceFolder` 的目录名
  - `${fileBasename}` - 当前打开文件的基本名称
  - `${fileBasenameNoExtension}` - 当前打开文件不带文件扩展名的基本名称
  - `${fileExtname}` - 当前打开文件的扩展名
  - `${fileDirname}` - 当前打开文件的目录名
  - `${datetime}` - 当前日期和时间，格式为 `"yyyyMMDDHHmmss"`，你可以通过格式字符串自定义格式。例如：`${datetime|yyyy-MM-DD_HH-mm-ss}`
  - `${selectedText}` - 当前选中的文本。如果选中的文本包含非法字符 `\/:*?""<>|

`，它将返回 ""。你也可以设置默认文本，例如：`${selectedText|默认文本}`，如果选中的文本包含非法字符或选中文本为空，它将返回默认文本。
  - `${uuid}` - 一个随机的 UUID v4
- `MarkdownPaste.path`

  图片将保存的文件夹路径。支持绝对路径、相对路径和预定义变量。

  默认值是 `${fileDirname}`。

- `MarkdownPaste.nameBase`

  作为默认图片文件名的字符串。支持预定义变量。

  默认值是 `${datetime|yyyyMMDDHHmmss}`。

- `MarkdownPaste.namePrefix`

  添加到默认图片文件名前面的字符串。支持预定义变量。

  默认值是 `""`。

- `MarkdownPaste.nameSuffix`

  添加到默认图片文件名后面的字符串。支持预定义变量。

  默认值是 `""`。

- `MarkdownPaste.silence`

  启用/禁用粘贴图片时显示确认框。将此配置选项设置为 `true`，粘贴图片时将不显示文件名确认框。

  默认值是 `false`。

- `MarkdownPaste.enableImgTag`

  启用/禁用使用带有宽度和高度的 HTML img 标签粘贴图片。如果启用此选项，你可以在文件名确认输入框中使用 `<filepath>[?width,height]` 输入宽度和高度。例如输入 `bcilename.png?200,100`，然后会插入 `<img src='bcilename.png' width='200' height='100' />`。

  默认值是 `true`。

- `MarkdownPaste.encodePath`

  将路径链接编码为 URL-encode 格式。

  - `encodeURI` 将所有字符编码为 URL-encode 格式。
  - `encodeSpaceOnly` 仅将 `' '`（空格）编码为 `'%20'`。
  - `none` 不进行编码。

  默认值是 `encodeSpaceOnly`。

- `MarkdownPaste.rules`

  如果你想定义自己的正则表达式来解析和替换粘贴的文本内容。你可以填写以下 JSON，并将其设置为此选项。

  ```json
  [{
      // 规则 1
      "regex": "(https?:\/\/.*)", // 你的 JavaScript 风格正则表达式
      "options": "ig",            // 正则表达式选项
      "replace": "[]($1)"         // 替换字符串
  },
  {
      // 规则 2
      "regex": "(https?:\/\/.*)", // 你的 JavaScript 风格正则表达式
      "options": "ig",            // 正则表达式选项
      "replace": "[]($1)"         // 替换字符串
  },
  ...
  ]
  ```

  扩展会尝试使用此选项中定义的正则表达式测试文本内容，如果匹配，它将使用 TypeScript 函数 string.replace() 替换内容。

  默认值是：

  ```json
  [
    {
      "regex": "^(?:https?://)?(?:(?:(?:www\.?)?youtube\.com(?:/(?:(?:watch\?.*?v=([^&\s]+).*)|))?))",
      "options": "g",
      "replace": "[![](https://img.youtube.com/vi/$1/0.jpg)](https://www.youtube.com/watch?v=$1)"
    },
    {
      "regex": "^(https?://.*)",
      "options": "ig",
      "replace": "[]($1)"
    }
  ]
  ```

  **注意** 粘贴图片时，此选项也应用于渲染图片路径链接。

- `MarkdownPaste.applyAllRules`

  如果为 true，它将按顺序将所有规则应用于同一文本，而不仅仅是第一个适用的规则。

  默认值是 `True`。

- `MarkdownPaste.enableHtmlConverter`

  启用/禁用将 html 转换为 markdown。

  默认值是 `True`。

- `MarkdownPaste.enableRulesForHtml`

  启用/禁用在将 html 转换为 markdown 后使用规则。

  默认值是 `True`。

- `MarkdownPaste.turndownOptions`

  在将 html 转换为 markdown 时使用 turndown 选项，详情请参见 [turndown options](https://github.com/mixmark-io/turndown#options)。

  默认值是 `setext`。

- `MarkdownPaste.lang_rules`

  与 `MarkdownPaste.rules` 类似，你可以为其他语言（例如：asciidoc）定义规则。

  ```json
  [
    [
      {
        "asciidoc": [
          {
            "regex": "^(?:https?://)?(?:(?:(?:www\.?)?youtube\.com(?:/(?:(?:watch\?.*?v=([^&\s]+).*)|))?))",
            "options": "g",
            "replace": "image::https://img.youtube.com/vi/$1/0.jpg[link="https://www.youtube.com/watch?v=$1"]"
          },
          {
            "regex": "^(https?://.*)",
            "options": "ig",
            "replace": "image::$1[linktext,300]"
          },
          {
            "regex": "(.*/media/)(.*)",
            "options": "",
            "replace": "image::$2[linktext,300]"
          }
        ]
      },
      {
        "markdownx": [
          {
            "regex": "^(?:https?://)?(?:(?:(?:www\.?)?youtube\.com(?:/(?:(?:watch\?.*?v=([^&\s]+).*)|))?))",
            "options": "g",
            "replace": "[![](https://img.youtube.com/vi/$1/0.jpg)](https://www.youtube.com/watch?v=$1)"
          },
          {
            "regex": "^(https?://.*)",
            "options": "ig",
            "replace": "[]($1)"
          }
        ]
      }
    ]
  ]
  ```

  **注意** 如果匹配了任何语言规则，它将不再应用 `MarkdownPaste.rules`。

- `MarkdownPaste.autoSelectClipboardType`

  当有多个剪贴板类型可用时自动选择剪贴板类型。默认是：`html&text`。

- `MarkdownPaste.autoSelectClipboardTypePriority`

  自动选择剪贴板类型的优先级。默认是：

  ```json
  ["image", "html", "text"]
  ```

- `MarkdownPaste.enableAI`

  启用 AI 剪贴板解析功能。默认是 `false`。

- `MarkdownPaste.openaiConnectOption`

  设置 OpenAI（兼容）连接选项。默认是：

  ```json
  "MarkdownPaste.openaiConnectOption": {
      "apiKey": "",
      "baseURL": "https://api.groq.com/openai/v1",
      "maxRetries": 2
  }
  ```

  扩展默认使用 Groq LLM 服务器。你可以从 [Groq.com](https://groq.com/) 获取 API 密钥。
  扩展使用 [OpenAi Node](https://github.com/openai/openai-node) 连接 LLM 服务器。因此，你也可以通过设置 `MarkdownPaste.openaiConnectOption.baseURL` 使用另一个 LLM 服务器，例如 `MarkdownPaste.openaiConnectOption.baseURL = "https://api.openai.com/v1"`，关于 openai 连接选项的更多细节，请参见：https://github.com/openai/openai-node

- `MarkdownPaste.openaiCompletionTemplate`

  设置 OpenAI 完成模板。默认是：

  ```json
  [
    {
      "model": "llama-3.1-70b-versatile",
      "messages": [
        {
          "role": "system",
          "content": ["You are a helpful assistant."]
        },
        {
          "role": "user",
          "content": [
            "Translate the following text into English and output in markdown format:",
            "{{clipboard_text}}"
          ]
        }
      ],
      "max_tokens": 4096
    }
  ]
  ```

  注意：扩展会将 `{{clipboard_text}}` 替换为你的剪贴板内容。

- `MarkdownPaste.openaiCompletionTemplateFile`

  设置 OpenAI 完成模板文件。默认是：`${fileWorkspaceFolder}/.openaiCompletionTemplate.json`

  如果你想编写更复杂的 AI 完成模板，可以使用此选项。

- **`MarkdownPaste.imageRules`**
  **(新功能)** 定义自定义规则，根据当前 Markdown 文件的路径修改目标图像路径和 Markdown 链接模式。每个规则是一个具有以下属性的对象：

  - `match`：一个正则表达式模式（作为字符串），用于测试当前 Markdown 文件的完整路径。
  - `targetPath`：一个字符串模式（支持预定义变量），指定图像应保存的位置。
  - `linkPattern`：一个字符串模式（支持预定义变量），指定图像的 Markdown 链接应如何格式化。你可以使用 `${altText}` 作为选中的文本，`${imageFilePath}` 作为设置中图像保存的路径。
  - `options`（可选）：匹配模式的正则表达式选项（例如，`"i"`）。

  **示例：**

  ```json
  "MarkdownPaste.imageRules": [
    {
      "match": "courses.*cysec",
      "targetPath": "${workspaceFolder}/labs/public/images/cysec/${fileBasenameNoExtension}_${datetime|yyyy-MM-DD_HH-mm-ss}",
      "linkPattern": "![${altText}](/images/cysec/${fileBasenameNoExtension}_${datetime|yyyy-MM-DD_HH-mm-ss}.png)"
    },
    {
      "match": "courses.*wired",
      "targetPath": "${workspaceFolder}/labs/public/images/wired/${fileBasenameNoExtension}_${datetime|yyyy-MM-DD_HH-mm-ss}",
      "linkPattern": "<img src='/images/wired/${fileBasenameNoExtension}_${datetime|yyyy-MM-DD_HH-mm-ss}.png' alt='${altText}'/>"
    }
  ]
  ```

## 问题和建议

1. 请通过以下链接提交错误：

   https://github.com/telesoho/vscode-markdown-paste-image/issues

2. 请通过以下链接发布建议：

   https://github.com/telesoho/vscode-markdown-paste-image/discussions

## 贡献

有关改进扩展的想法和指导，请参阅[贡献指南](./CONTRIBUTING.md)。谢谢！

## 许可证
