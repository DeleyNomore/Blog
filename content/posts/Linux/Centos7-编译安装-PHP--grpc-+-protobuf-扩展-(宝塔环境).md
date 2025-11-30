---
title: "Centos7 编译安装 PHP grpc protobuf 扩展(宝塔环境)"
date: 2025-11-14T08:22:46+08:00
draft: false
categories: ["Linux"]
tags: ["linux", "centos", "php", "grpc", "protobuf", "宝塔面板"]
slug: "centos7-compile-and-install-php-grpc-protobuf-extension-baota-environment"
---



### 以PHP7.2为例

#### 编译安装 grpc 扩展 (注意 grpc 版本对应的 protobuf 版本号)

```shell

# 下载解压 grpc
cd ~
wget http://pecl.php.net/get/grpc-1.30.0.tgz
tar xvf grpc-1.30.0.tgz
cd grpc-1.30.0

# 生成配置并编译安装(编译安装时间较长, 耐心等待)
/www/server/php/72/bin/phpize
./configure --with-php-config=/www/server/php/72/bin/php-config
make && make install

# 配置PHP扩展, 重启PHP服务, 清理下载文件
echo "extension = grpc.so" >> /www/server/php/72/etc/php.ini
/etc/init.d/php-fpm-72 reload
/www/server/php/72/bin/php -m|grep -i  gRPC
cd .. && rm -rf grpc-1.30.0*

```

#### 编译安装 protobuf 扩展

```shell

# 下载解压 protobuf
cd ~
wget http://pecl.php.net/get/protobuf-3.12.2.tgz
tar xvf protobuf-3.12.2.tgz
cd protobuf-3.12.2

# 生成配置并编译安装(编译安装时间较长, 耐心等待)
/www/server/php/72/bin/phpize
./configure --with-php-config=/www/server/php/72/bin/php-config
make && make install

# 配置PHP扩展, 重启PHP服务, 清理下载文件
echo "extension = protobuf.so" >> /www/server/php/72/etc/php.ini
/etc/init.d/php-fpm-72 reload
/www/server/php/72/bin/php -m|grep -i  protobuf
cd .. && rm -rf protobuf-3.12.2*

```

---

### grpc 版本对应的 protobuf 版本号

|        |           |         |          |         |          |
| ------ | --------- | ------- | -------- | ------- | -------- |
| grpc   | protobuf  | grpc    | protobuf | grpc    | protobuf |
| v1.0.0 | 3.0.0(GA) | v1.12.0 | 3.5.2    | v1.22.0 | 3.8.0    |
| v1.0.1 | 3.0.2     | v1.13.1 | 3.5.2    | v1.23.1 | 3.8.0    |
| v1.1.0 | 3.1.0     | v1.14.2 | 3.5.2    | v1.24.0 | 3.8.0    |
| v1.2.0 | 3.2.0     | v1.15.1 | 3.6.1    | v1.25.0 | 3.8.0    |
| v1.2.0 | 3.2.0     | v1.16.1 | 3.6.1    | v1.26.0 | 3.8.0    |
| v1.3.4 | 3.3.0     | v1.17.2 | 3.6.1    | v1.27.3 | 3.11.2   |
| v1.3.5 | 3.2.0     | v1.18.0 | 3.6.1    | v1.28.1 | 3.11.2   |
| v1.4.0 | 3.3.0     | v1.19.1 | 3.6.1    | v1.29.0 | 3.11.2   |
| v1.6.0 | 3.4.0     | v1.20.1 | 3.7.0    | v1.30.0 | 3.12.2   |
| v1.8.0 | 3.5.0     | v1.21.3 | 3.7.0    |         |          |

---

#### 链接
*  [宝塔 - 安装第三方PHP扩展示例](https://www.bt.cn/bbs/thread-10153-1-1.html)
*  [grpc.io](https://grpc.io/)
*  [github - grpc/src/php](https://github.com/grpc/grpc/tree/master/src/php)
*  [pecl- protobuf](https://pecl.php.net/package/protobuf)
*  [pecl- gRPC](https://pecl.php.net/package/gRPC)



