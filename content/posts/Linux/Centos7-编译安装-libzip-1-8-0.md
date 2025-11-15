---
title: "Centos7 编译安装 libzip 1 8 0"
date: 2025-11-14T08:22:46+08:00
draft: false
categories: ["Linux"]
tags: ["linux", "centos", "libzip", "编译安装", "依赖库"]
---

CentOS 7 源码安装 libzip 1.8.0，解决 `error: Please reinstall the libzip distributio` 或 `error: system libzip must be upgraded to version >= 0.11` 错误。

#### 1、准备编译环境

```bash
yum install openssl-devel bzip2 bzip2-devel
```

#### 2、下载源码，并解压

```bash
wget https://libzip.org/download/libzip-1.8.0.tar.gz --no-check-certificate \
&& tar -zxf libzip-1.8.0.tar.gz \
&& cd libzip-1.8.0
```

备用下载地址：[https://down.24kplus.com/linux/libzip/libzip-1.8.0.tar.gz](https://down.24kplus.com/linux/libzip/libzip-1.8.0.tar.gz)

#### 3、编译安装

```bash
mkdir build && cd build \
&& cmake -DCMAKE_INSTALL_PREFIX=/usr .. \
&& make \
&& sudo make install
```

如果提示 `cmake: command not found`，需要先安装 [cmake](https://www.jianshu.com/p/35ba40d7c10b)。

---
* 参考 https://www.24kplus.com/linux/566.html

