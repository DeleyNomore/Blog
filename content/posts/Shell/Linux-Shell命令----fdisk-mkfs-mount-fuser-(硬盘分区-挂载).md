---
title: "Linux Shell 命令 fdisk mkfs mount fuser (硬盘分区 挂载)"
date: 2025-11-14T08:22:46+08:00
draft: false
categories: ["Shell"]
tags: ["linux", "shell", "fdisk", "mkfs", "mount", "硬盘分区"]
slug: "linux-shell-commands-fdisk-mkfs-mount-fuser-disk-partition-mount"
---

<br>

## Linux 硬盘

在 Linux 中，外围设备都位于 `/dev` 挂载点，内核通过以下的方式理解硬盘：

* `/dev/hdX[a-z]`: IDE 硬盘被命名为 hdX
* `/dev/sdX[a-z]`: SCSI 硬盘被命名为 sdX
* `/dev/xdX[a-z]`: XT 硬盘被命名为 xdX
* `/dev/vdX[a-z]`: 虚拟硬盘被命名为 vdX
* `/dev/fdN`: 软盘被命名为 fdN
* `/dev/scdN` or `/dev/srN`: CD-ROM 被命名为 /dev/scdN 或 /dev/srN  

<br>

## fdisk 硬盘分区命令

```ini

用法:
fdisk [options] <disk>             更改分区表
fdisk [options] -l [<disk>]        列出分区表

显示或操作磁盘分区表。

选项:
-b, --sector-size <size>       物理和逻辑扇区大小
-B, --protect-boot             在创建新标签时不删除引导位
-c, --compatibility[=<mode>]   模式为"dos"或"nondos"(默认)
-L, --color[=<when>]           对输出着色(auto|always|never)
                               默认情况下启用颜色
-l, --list                     显示分区并退出
-o, --output <list>            输出列
-t, --type <type>              只识别指定的分区表类型
-u, --units[=<unit>]           显示单位: 圆柱体:"cylinders" 或 扇区:"sectors" (默认值)
-s, --getsz                    以512字节扇区显示设备大小[已弃用]
    --bytes                    以字节而不是人类可读的格式打印大小
-w, --wipe <mode>              擦除签名(自动、始终或从不) (auto|always|never)
-W, --wipe-partitions <mode>   从新分区擦除签名(自动、始终或从不) (auto|always|never)

-C, --cylinders <number>       指定硬盘的柱面数
-H, --heads<number>            指定硬盘的磁头数
-S, --sectors <number>         指定每个磁道的扇区数,用于分区表,一个合理的数值是63

-h, --help                     显示此帮助
-V, --version                  显示版本

可用输出列:
gpt: 设备开始-结束扇区大小类型 Type-UUID Attrs名称UUID
dos: 设备起始端扇区柱面大小类型 Id Attrs Boot End-C/H/S Start-C/H/S
bsd: 切片开始结束扇区柱面大小类型 Bsize Cpg Fsize
sgi: 设备起始端扇区柱面大小类型Id属性
sun: 设备开始结束扇区柱面大小类型Id标志

有关详细信息，请参见fdisk(8)。

---------------------------------------------------------------------

更改分区表 [帮助]

DOS(MBR)
a 切换可引导标志
b 编辑嵌套BSD disklabel
c 切换dos兼容性标志


通用:

d 删除分区
F 列出未划分的可用空间
l 列出已知分区类型
n 添加新分区
p 打印分区表
t 更改分区类型
v 验证分区表
i 打印分区信息


其他:

m 打印此菜单
u 更改显示/输入单位
x 额外功能(仅限专家)


脚本:

I 从sfdisk脚本文件加载磁盘布局
O 将磁盘布局转储到sfdisk脚本文件


保存并退出:

w 将表写入磁盘并退出
q 不保存更改就退出


创建新标签:

g 创建一个新的空GPT分区表
G 创建一个新的空SGI(IRIX)分区表
o 创建一个新的空DOS分区表
s 创建一个新的空Sun分区表

```
 
<br>

## mount 挂载设备命令

```ini

语法:

mount [-hV]
mount -a [-fFnrsvw] [-t vfstype]
mount [-fnrsvw] [-o options [,...]] device | dir
mount [-fnrsvw] [-t vfstype] [-o options] device dir

-V：显示程序版本
-h：显示辅助讯息
-v：显示较讯息，通常和 -f 用来除错。
-a：将 /etc/fstab 中定义的所有档案系统挂上。
-F：这个命令通常和 -a 一起使用，它会为每一个 mount 的动作产生一个行程负责执行。在系统需要挂上大量 NFS 档案系统时可以加快挂上的动作。
-f：通常用在除错的用途。它会使 mount 并不执行实际挂上的动作，而是模拟整个挂上的过程。通常会和 -v 一起使用。
-n：一般而言，mount 在挂上后会在 /etc/mtab 中写入一笔资料。但在系统中没有可写入档案系统存在的情况下可以用这个选项取消这个动作。
-s-r：等于 -o ro
-w：等于 -o rw
-L：将含有特定标签的硬盘分割挂上。
-U：将档案分割序号为 的档案系统挂下。-L 和 -U 必须在/proc/partition 这种档案存在时才有意义。
-t：指定档案系统的型态，通常不必指定。mount 会自动选择正确的型态。
-o async：打开非同步模式，所有的档案读写动作都会用非同步模式执行。
-o sync：在同步模式下执行。
-o atime、-o noatime：当 atime 打开时，系统会在每次读取档案时更新档案的『上一次调用时间』。当我们使用 flash 档案系统时可能会选项把这个选项关闭以减少写入的次数。
-o auto、-o noauto：打开/关闭自动挂上模式。
-o defaults:使用预设的选项 rw, suid, dev, exec, auto, nouser, and async.
-o dev、-o nodev-o exec、-o noexec允许执行档被执行。
-o suid、-o nosuid：
允许执行档在 root 权限下执行。
-o user、-o nouser：使用者可以执行 mount/umount 的动作。
-o remount：将一个已经挂下的档案系统重新用不同的方式挂上。例如原先是唯读的系统，现在用可读写的模式重新挂上。
-o ro：用唯读模式挂上。
-o rw：用可读写模式挂上。
-o loop=：使用 loop 模式用来将一个档案当成硬盘分割挂上系统。

```

<br>

## 扩展笔记 : 

> Linux 下第一块磁盘标记为 `/dev/sda`
>
> `ls /dev/` 列出所有设备 (最原始的查找方法)
> `ls /dev/sda*` 或 `ls /dev | grep sda` 手动列出所有分区
> `df -hT` 查看已挂载的磁盘信息，包含分区类型，空间状态，挂载点信息等
> `lsblk` 列出所有 (存储) 块设备，包括未挂载磁盘
> `cfdisk` 傻瓜式磁盘分区
>
> `fdisk -l` 查看所有磁盘信息 (包括未挂载磁盘)
> `fdisk /dev/sda` 或 `cfdisk /dev/sda` 对第一块磁盘进行分区操作 (大于 2T 时用`parted /dev/sda`)
> `fdisk /dev/sda` > `p` 查看当前硬盘信息
> `fdisk /dev/sda` > `F` 查看当前硬盘未分配空间
> `fdisk /dev/sda` > `n` > `p` 新建主分区 (根据情况操作)
> `fdisk /dev/sda` > `n` > `e` 新建逻辑分区 (根据情况操作)
> `fdisk /dev/sda` > `d` 删除分区 (选择要删除的分区号)
>  新建分区时，用 `+100M` 或 `+100K` 指令，可以更方便的设置分区大小，`M` 为单位，`100`为大小
>  进行分区操作后，输入`w` 保存分区更改并退出 (写入分区表)
> 
> `mkfs.ext4 /dev/sda1` 格式化分区 (创建 ext4 格式文件系统)
> `mkfs.xfs /dev/sda1` 格式化分区 (创建 xfs 格式文件系统)
> `mkfs -t ext4 -L 'testdisk' /dev/sda1` 创建 ext4 文件系统并指定卷标为 *testdisk*
> `partprobe /dev/sda` 不重启重读分区表
> 
> `mount DEVICE MOUNT_POINT` 挂载设备
> `umount MOUNT_POINT` 或 `umount DEVICE` 卸载设备 (取消挂载)
> ~MOUNT_POINT~ 指定挂载目录路径 (挂载点) 
> ~DEVICE~ 指定要挂载的设备，例如 `/dev/sda1`
> 
> 挂载点 MOUNT_POINT :
> * 应事先存在 (建议使用空目录)
> * 挂载点下原有的文件将会被隐藏
> * 应该使用未被或不会被其它进程使用到的目录 (`fuser -v MOUNT_POINT` 查看正在访问指定文件系统的进程)
> * 进程正在使用中的设备无法被卸载 (`fuser -km MOUNT_POINT` 终止所有在正访问指定的文件系统的进程，慎用)
>
> 挂载设备 DEVICE :
> * 设备文件：例如 `/dev/sda1`
> * 卷标：`-L 'LABEL'`, 例如 `-L 'MYDATA'`
> * UUID 唯一标识符：`-U 'UUID'`, 例如 `-U '0c50523c-43f1-45e7-85c0-a126711d406e'`
> * 伪文件系统名称：`proc`, `sysfs`, `devtmpfs`, `configfs`
>
> `cat /etc/mtab` 查看当前系统已挂载的所有设备
> `mkdir  /mnt/sda1_newdisk` 创建挂载目录 (`sda1_newdisk`目录名，`/mnt`专门用于挂载的)
> `mkdir /home/sda1` 你也可以创建其他路径的目录，例如`/home`下边
> `mount /dev/sda1 /mnt/sda1_newdisk` 挂载到 `/mnt` (临时挂载，重启失效)
> `mount /dev/sda1 /home/sda1` 挂载到 `/home` (临时挂载，重启失效)
> `echo "/dev/sda1     /home/sda1     ext4    defaults    0 0" >> /etc/fstab` 将信息写入 fstab, 设置系统自动挂载（永久挂载）
> `blkid` 或 `blkid /dev/sda1` 查看文件系统类型/卷标/UUID
> `echo "UUID=b9c9a454-f619-4759-ba19-4b4827929bd0     /home/sda1     ext4    defaults    0 0" >> /etc/fstab ` 通过卷标自动挂载
> `vim /etc/fstab` 手动编辑自动挂载配置
> `mount -a` 将 /etc/fstab 中定义的所有文件系统挂上，并立即生效
> `fuser -v /home/sda1` 查看正在访问`/home/sda1`目录的进程
> `fuser -km /home/sda1` 终止所有在正在访问`/home/sda1`目录的进程
> `umount /dev/sda1` 或 `umount  /home/sda1` 取消挂载
> 

<br>

### 文章链接：

---
* MBR 磁盘分区表只能有四个分区？[跳转 >>](https://blog.csdn.net/White_Idiot/article/details/80088115)
* 硬盘分区表扫盲：MBR 和 GPT 表，你在用哪一样？[跳转 >>](https://www.ithome.com/html/win8/58192.htm)
* Linux 主分区，扩展分区，逻辑分区的联系和区别 [跳转 >>](https://www.cnblogs.com/w-wfy/p/8870598.html)
* linux 磁盘分区 fdisk 命令详解 [跳转 >>](https://blog.51cto.com/linux008/548711)
* fdisk：Linux 下管理磁盘分区的利器 [跳转 >>](https://linux.cn/article-10508-1.html)
* Linux 下使用 fdisk 扩大分区容量（不丢失数据）[跳转 >>](https://blog.51cto.com/sandshell/2119523)
* 通过 fdisk 对磁盘分区扩容 [跳转 >>](https://hughsite.com/post/linux-fdisk-extend-partition.html)
* 大硬盘（大于 2T）分区方法 [跳转 >>](https://www.cnblogs.com/jack34/p/8965114.html)
* Linux 服务器升级硬盘以后通过 parted 进行磁盘分区扩容操作流程 [跳转 >>](http://www.21yunwei.com/archives/1442)
* linux 里挂载（mount）和取消挂载（umount）命令的使用 [跳转 >>](https://blog.csdn.net/xiyangyang8/article/details/49725039)
* Linux mount 命令进阶 [跳转 >>](https://www.cnblogs.com/sparkdev/p/9045563.html)








