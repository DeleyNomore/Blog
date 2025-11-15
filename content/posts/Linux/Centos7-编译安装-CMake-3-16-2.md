---
title: "Centos7 编译安装 CMake 3 16 2"
date: 2025-11-14T08:22:46+08:00
draft: false
categories: ["Linux"]
tags: ["linux", "centos", "cmake", "编译安装", "开发环境"]
---

CentOS 7 源码安装 CMake 3.16.2 最新稳定版。解决 `cmake: command not found` 问题。

#### 1、准备编译环境

```bash
yum -y install gcc gcc-c++ openssl openssl-devel tar
```

#### 2、获取源码，并解压

```bash
wget https://github.com/Kitware/CMake/releases/download/v3.16.2/cmake-3.16.2.tar.gz
tar -zxf cmake-3.16.2.tar.gz
cd cmake-3.16.2
```

备用下载地址：[https://down.24kplus.com/linux/cmake/cmake-3.16.2.tar.gz](https://down.24kplus.com/linux/cmake/cmake-3.16.2.tar.gz)

#### 3、编译安装

```bash
./bootstrap --prefix=/usr --datadir=share/cmake --docdir=doc/cmake && make
sudo make install
```

#### 4、检查是否正确安装

```bash
cmake --version
```

`cmake version 3.16.2`

`CMake suite maintained and supported by Kitware (kitware.com/cmake).`

---
* 参考 https://www.24kplus.com/linux/1598.html

