---
title: "WSL2 安装详细过程与问题解决方案记录 + 安装 Docker Desktop"
date: 2025-11-14T08:22:46+08:00
draft: false
categories: ["Windows"]
---

# WSL2 安装详细过程与问题解决方案记录

## 系统环境
- Windows 10 企业版 LTSC 21H2
- OS内部版本 19044.6456
- 目标：在不开启Hyper-V功能的情况下安装Docker（使用WSL2后端）

## 完整安装流程

### 1. 前置条件检查
首先确认BIOS中已启用虚拟化：
```powershell
# 检查任务管理器 → 性能 → CPU → 虚拟化是否已启用
```
✅ 确认：任务管理器显示"虚拟化：已启用"

### 2. 启用必要Windows功能
以管理员身份运行PowerShell：
```powershell
# 启用Windows子系统Linux
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# 启用虚拟机平台
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```
✅ 两个功能均成功启用

### 3. 关键步骤：修复Hypervisor启动配置
这是LTSC版本上最常见的问题根源：
```powershell
# 以管理员身份运行（使用Windows PowerShell，不是PowerShell 7）
bcdedit /set hypervisorlaunchtype Auto
```
✅ 返回："The operation completed successfully."

### 4. 重启系统
```powershell
# 必须重启才能使上述配置生效
shutdown /r /t 0
```

### 5. 验证Hypervisor配置
重启后，检查配置是否生效：
```powershell
bcdedit /enum | findstr -i hypervisorlaunchtype
```
✅ 期望输出：`hypervisorlaunchtype    Auto`

### 6. 安装Ubuntu
- 从Microsoft Store安装"Ubuntu 22.04 LTS"
- 首次启动，按照提示创建用户名和密码

### 7. 验证WSL版本与升级
安装后检查当前版本：
```powershell
wsl -l -v
```
输出示例：
```
  NAME            STATE           VERSION
* Ubuntu-22.04    Running         1
```

升级到WSL2：
```powershell
wsl --set-version Ubuntu-22.04 2
```
✅ 升级成功后，验证：
```powershell
wsl -l -v
```
✅ 期望输出：
```
  NAME            STATE           VERSION
* Ubuntu-22.04    Running         2
```

### 8. 设置WSL2为默认版本（推荐）
```powershell
wsl --set-default-version 2
```

### 9. WSL内核更新（可选但推荐）
```powershell
# 检查当前WSL版本
wsl --version

# 更新到最新内核
wsl --update
```

### 10. 验证最终状态
```powershell
wsl --status
wsl -l -v
```

## 遇到的问题及详细解决方案

### 问题1：WSL命令显示帮助而非发行版列表
- **现象**：运行`wsl -l -v`显示用法信息而非发行版
- **原因**：WSL功能已启用，但未安装任何Linux发行版
- **解决方案**：
  1. 从Microsoft Store安装Ubuntu 22.04 LTS
  2. 首次启动并完成用户设置
  3. 再次运行`wsl -l -v`应显示已安装的发行版

### 问题2：安装Ubuntu时错误0x80370102
- **现象**：安装失败，提示"Please enable the Virtual Machine Platform Windows feature and ensure virtualization is enabled in the BIOS"
- **原因分析**：
  - 虚拟化已在BIOS启用
  - VirtualMachinePlatform功能已启用
  - LTSC版本缺少Hypervisor Platform组件支持
  - Hypervisor启动类型未正确设置
- **解决方案**：
  1. 确认Hypervisor启动类型：
     ```powershell
     bcdedit /enum | findstr -i hypervisorlaunchtype
     ```
     若不是"Auto"，则修复它
  2. 关键命令：
     ```powershell
     bcdedit /set hypervisorlaunchtype Auto
     ```
  3. 重启电脑
  4. 重试安装Ubuntu

### 问题3：无法升级到WSL2（VERSION保持为1）
- **现象**：执行`wsl --set-version Ubuntu-22.04 2`后仍显示VERSION 1
- **原因**：Hypervisor配置不正确，WSL2无法启动虚拟化环境
- **解决方案**：
  1. 再次确认：
     ```powershell
     bcdedit /set hypervisorlaunchtype Auto
     ```
  2. 重启电脑
  3. 重新尝试升级：
     ```powershell
     wsl --set-version Ubuntu-22.04 2
     ```
  4. 若仍失败，更新WSL内核：
     ```powershell
     wsl --update
     ```

### 问题4：检测是否需要更新WSL内核
- **判断方法**：
  ```powershell
  wsl --version
  ```
- **解释**：如果版本较旧（如低于5.10.x），建议更新
- **更新命令**：
  ```powershell
  wsl --update
  ```
- **验证**：更新后再次运行`wsl --version`确认

### 问题5：root用户认证失败
- **现象**：运行`su`提示"Authentication failure"
- **原因**：WSL中root用户默认没有设置密码
- **解决方案**：
  1. 使用sudo方式（推荐）：
     ```bash
     sudo -i  # 无需root密码，使用当前用户密码
     ```
  2. 或设置root密码（不推荐）：
     ```bash
     sudo passwd root
     ```

### 问题6：安装多个Ubuntu 22.04实例
- **需求**：需要多个相同版本的Ubuntu环境
- **解决方案**：
  1. 导出现有Ubuntu：
     ```powershell
     wsl --export Ubuntu-22.04 C:\temp\ubuntu-export.tar
     ```
  2. 导入为新实例：
     ```powershell
     wsl --import Ubuntu-ProjA C:\wsl\Ubuntu-ProjA C:\temp\ubuntu-export.tar --version 2
     ```
  3. 为新实例设置默认用户：
     ```powershell
     wsl -d Ubuntu-ProjA -u root
     ```
     然后在Linux shell中：
     ```bash
     adduser yourname
     usermod -aG sudo yourname
     echo -e "[user]\ndefault = yourname" > /etc/wsl.conf
     exit
     ```

## 安装Docker Desktop
WSL2配置成功后：
1. 从官网下载Docker Desktop
2. 安装时勾选"Use WSL 2 based engine"
3. 启动后，Docker会自动连接到WSL2后端
4. 验证安装：在PowerShell中运行`docker --version`和`docker run hello-world`

## 最终验证
```powershell
# 检查WSL状态
wsl --status

# 检查所有发行版及其版本
wsl -l -v

# 检查Docker是否能正常运行
docker run --rm hello-world
```

## 重要提示
1. **LTSC版本特殊性**：企业版LTSC精简了虚拟化组件，必须手动配置Hypervisor启动类型
2. **重启关键性**：每次修改虚拟化设置后必须重启
3. **权限要求**：多数关键命令需要管理员权限
4. **WSL2优先**：始终使用WSL2而非WSL1，特别是为了Docker支持
5. **安全实践**：在WSL中使用`sudo -i`而非`su`切换到root

## 总结
安装WSL2在LTSC版本上的核心是正确配置虚拟化环境，关键命令`bcdedit /set hypervisorlaunchtype Auto`解决了大多数问题。虽然系统提示可能指向启用Virtual Machine Platform，但根本原因往往是Hypervisor启动配置。完成WSL2设置后，Docker Desktop可以无缝集成，无需启用完整的Hyper-V功能。

