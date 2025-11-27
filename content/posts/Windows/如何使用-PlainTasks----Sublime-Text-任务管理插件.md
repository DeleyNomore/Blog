---
title: "如何使用 PlainTasks Sublime Text 任务管理插件"
date: 2025-11-14T08:22:46+08:00
draft: false
categories: ["Windows"]
tags: ["windows", "sublime text", "plaintasks", "任务管理", "插件"]
---

> PlainTasks 是一个用于 Sublime Text 的插件，旨在帮助用户管理待办事项和任务列表。它提供了一个简单而高效的方式来创建、组织和跟踪任务。PlainTasks 支持多种文件类型，可以根据系统时间动态高亮显示即将到期或已过期的任务，并提供自定义功能，如项目符号、文件类型、键绑定、日期格式、颜色方案等。此外，它还具有方便的编辑器工具，如移动任务、查看项目列表和拼写检查等功能。以下是如何自定义和使用 PlainTasks 的详细说明。(Tutorial.todo 汉化版)

## 安装 Sublime Text 插件 PlainTasks

要在 Sublime Text 中安装 PlainTasks 插件，可以按照以下步骤进行：

1. **安装 Package Control**：
  根据官方文档安装，文档地址 https://packagecontrol.io/installation
  如果已经安装请跳过

2. **安装 PlainTasks**：
   - 按下 `Ctrl+Shift+P`（Mac 上是 `Cmd+Shift+P`）打开命令面板。
   - 输入 `Package Control: Install Package` 并选择它。
   - 在弹出的包列表中，输入 `PlainTasks` 并选择它进行安装。

3. **使用 PlainTasks**：
   - 创建或打开一个支持的文件类型（例如 `.todo`、`.todolist`、`.taskpaper` 或 `.tasks`）。
   - 开始使用 PlainTasks 的功能来管理你的任务列表。

## PlainTasks 使用教程
安装好 PlainTasks 插件后，将以下内容另存为 Tutorial-CN.todo 在 Sublime Text 里打开阅读

```todo
如何使用PlainTasks:

项目:
☐ 以冒号结尾的行表示项目标题
☐ 项目可以相互嵌套
☐ 项目可以折叠（内建编辑器功能）

任务:
您可以在任何地方使用纯文本作为注释或描述；这完全没问题！

新建任务:
☐ ⌘+enter（Windows 上为ctrl+enter）添加新任务。
☐ ⌘+i（Windows 上为ctrl+i）也可以添加新任务。
☐ 如果您处于新行上，PlainTasks 会在当前行上创建新任务。
☐ 如果您处于具有任务的行上，按下新任务快捷键会在其后添加一个任务。
☐ 如果您处于具有普通文本的行上，按下新任务快捷键会将其转换为任务。
☐ 新任务的嵌套程度与前一行的任务相同。

完成任务:
☐ ⌘+d（Windows 上为ctrl+d）标记任务为已完成。
☐ 再次按下⌘+d（Windows 上为ctrl+d）将其置回待处理状态。
☐ ctrl+c（Windows 上为alt+c）标记任务为已取消。

标记:
☐ 您可以使用 "@"符号添加标记，例如 @tag
您可以将光标放在标记上，点击鼠标右键，在“光标下的标记进行筛选”下选择
带有选定标记的待办任务将保持可见（以及它们的备注和所属的项目），
但其他所有内容将被隐藏/折叠起来
要展开全部内容，请按下 ⌘+k、⌘+j 或 ⌘+k、⌘+0
☐ 您可以使用 ⌘+shift+r（Windows 上为 ctrl+shift+r）在当前文档中导航标记
URL:
☐ ⌘+shift+U（Windows 上为 ctrl+shift+U）会在默认浏览器中打开光标下的 URL
www.github.com 或 skype:nickname

文件链接:
☐ 您可以通过在文件名前加上点号和（反）斜杠来创建文件链接
例如：.\filename\ 或 ./another filename/
每行只支持一个文件名
文件名可以是绝对路径或相对路径（相对于项目文件夹或已打开的文件）
☐ 您可以在文件名后使用冒号指定行号和列号：.\filename:11:8
☐ 在 SublimeText 3 中，您可以使用 > 字符指定文件内的符号，例如：.\filename>symbol
☐ 在 SublimeText 2 中，您可以使用双引号指定文件内的文本，例如：.\filename"任意文本"
☐ ctrl+o（Windows 上为 alt+o）可在 Sublime 中打开文件：尝试打开 .\install.txt
☐ 在 SublimeText 3 中，链接可以指向目录，打开此类链接将将目录添加到当前项目（侧边栏），例如：...\PlainTasks
☐ 创建文件链接的其他方法：
      [](install.txt)  ← 尝试打开它
      [](path ":11:8")
      [](path ">symbol")
      [](path "any text")
      [[..\PlainTasks.py]]  ← 尝试打开它
      [[path::11:8]]
      [[path::*symbol]]
      [[path::any text]]
      [[path]] ":11:8"
      [[path]] ">symbol"
      [[path]] "任意文本"

归档:
☐ ⌘+shift+A（Windows 上为 ctrl+shift+A）将已完成的任务归档。
它会将这些任务从列表中移除，并将它们添加到文件底部的“Archive project”下。
归档项目与其他项目列表以一行分隔。请参阅文件底部。
☐ ⌘+shift+O（ctrl+shift+O）会以 Org-Mode 的方式进行归档。
删除光标后的整个子树，并将其追加到原始文件旁边的新文件中，
例如：filename.TODO → filename_archive.TODO

开始新的待办事项列表：
☐ 打开命令面板（Mac 上是 ⌘+shift+p，Windows 上是 ctrl+shift+p）
☐ 输入 task 并选择 Tasks: New document 命令

--- ✄ -----------------------
您可以使用分隔符代码片段来分隔您的待办事项列表，输入 -- 然后按下 Tab 键

优先级:
☐ 输入 c，然后按下 Tab 键 — 它将变为 @critical
☐ 输入 h，然后按下 Tab 键 — 它将变为 @high
☐ 输入 l，然后按下 Tab 键 — 它将变为 @low
☐ 输入 t，然后按下 Tab 键 — 它将变为 @today

时间追踪:
  ☐ 输入 s，按两次 Tab 键 —— 会变成 @started(13-10-25 15:20)
    你会得到当前的日期和时间；当带有此标签的任务完成/取消时，PlainTasks 会计算该任务花费的时间并将其附加到归档任务中。
    你可以重新计算已经完成/取消的任务：将光标放在标签上并按 Tab 键
  ☐ 输入 tg，按两次 Tab 键 —— @toggle(14-10-13 16:14)
    这样你可以暂停和恢复已开始的任务，从而使计算结果更准确。
    首先，你需要开始任务，然后 toggle 表示暂停，再次 toggle 表示恢复，以此类推。
  ☐ 输入 cr，按两次 Tab 键 —— @created(14-12-24 15:57)
    ⌘+shift+enter (ctrl+shift+enter) 创建一个带有此标签的新任务  
  ☐ 输入 d，按 Tab 键 —— @due( )
    如果你再次按 Tab 键 —— 会插入当前日期，同样适用于 @due( 0)。
    你可以输入短日期然后按 Tab 键将其扩展为默认格式。
    短日期格式应为 @due(年-月-日 时:分)
    点可以代替连字符，但应保持一致 年.月.日
      - 年、月、分钟、小时可以省略：
        - @due(1)          → 永远是下个月的第1天
        - @due(--1)         → 永远是当月的第1天
        - @due(5)          → 当前月份的第5天（如果当前日期是5号或更早，则是下个月的第5天）
        - @due(2-3)        → 当前年份或下一年的2月3日
        - @due(28 23:)     → 当前或下个月的28号23点，分钟等于当前时间
        - @due(16.1.1 1:1) → 2016年1月1日01:01 @due(16-01-01 01:01)
      - 相对时间段以加号或两个加号开头
        __+[+][number][DdWw][h:m]__ — number、d（天）和 w（周）都是可选项
        - @due(+)   → 明天，等同于 @due( +1) 或 @due( +1d)
        - @due(+w)  = @due( +7)
        - @due(+3w) = @due( +21d)
        - @due(++)  → 如果任务包含 @created(date)，则从创建日期开始计算时间，否则等同于 @due(+)
        - @due(+2:)    = @due( +2.)    → 从当前日期算起的两小时
        - @due(+:555)  = @due( +.555)  → 从当前日期算起的555分钟
        - @due(+2 12:) = @due( +2 12.) → 从当前日期算起的2天12小时

    你可能注意到 due 标签看起来有些不同寻常，已过期或即将到期的任务（默认在接下来的24小时内到期）
    会根据系统时间动态高亮显示；
    你可以在命令面板中搜索“Tasks: Fold to due tasks”来折叠/隐藏除未完成任务外的所有内容，
    包括带有过期或即将到期标签的任务、它们的备注，以及它们所属的项目或分隔符。

☐ ctrl+space（在 Linux 上是 alt+/）显示这些标签的列表

文件类型支持:
 PlainTasks 原生支持以下文件类型
 ☐ TODO
 ☐ *.todo
 ☐ *.todolist
 ☐ *.taskpaper
 ☐ *.tasks

你可以自定义:
 ☐ 新建和完成的项目符号
 ☐ 被认为是待办事项列表的文件类型
 ☐ 如果你不喜欢默认的键绑定，可以自定义键绑定
 ☐ 完成任务的日期格式
 ☐ 颜色方案
 ☐ 统计外观
 ☐ 文件类型的图标
 ☐ 以及更多
 请参阅 GitHub 上的 Readme 文件了解如何进行这些自定义。https://github.com/aziz/PlainTasks
 或在 Sublime 中的 ./../Readme.md"## Settings"

编辑器有用工具:
 ☐ 使用 ⌘+control+up/down（Windows 上是 ctrl+shift+up/down）上下移动任务。
 ☐ 使用 ⌘+R（Windows 上是 ctrl+R）查看项目列表并快速在它们之间跳转
 ☐ F6 切换拼写检查

＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
归档:
 ✔ 学习如何使用 PlainTasks @done (12-09-07 07:30)

```

