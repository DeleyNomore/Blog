---
title: "BT 宝塔 PHP73 安装 zip 扩展"
date: 2025-11-14T08:22:46+08:00
draft: false
categories: ["Linux"]
tags: ["linux", "centos", "宝塔面板", "php", "zip 扩展"]
slug: "baota-php73-install-zip-extension"
---

### 1. 编译安装 CMake 3.16.2
> https://www.jianshu.com/p/35ba40d7c10b

### 2. 编译安装 libzip 1.8.0
> https://www.jianshu.com/p/d87787c33e19

### 3. 编译安装 ext-zip 扩展

```bash

cd /www/server/php/73/src/ext/zip/

/www/server/php/73/bin/phpize

./configure --with-php-config=/www/server/php/73/bin/php-config

make && make install

```

*安装成功提示*
`Installing shared extensions:www/server/php/73/lib/php/extensions/no-debug-non-zts-20180731/`

### 在 php.ini 文件末尾添加
```ini
extension = /www/server/php/73/lib/php/extensions/no-debug-non-zts-20180731/zip.so 
```


