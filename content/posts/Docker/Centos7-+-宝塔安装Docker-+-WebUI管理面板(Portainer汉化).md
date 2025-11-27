---
title: "Centos7 + 宝塔安装 Docker + WebUI 管理面板 (Portainer 汉化)"
date: 2025-11-14T08:22:46+08:00
draft: false
categories: ["Docker"]
tags: ["docker", "centos", "宝塔面板", "portainer", "安装指南"]
---


### 操作步骤

1. 先在宝塔里安装 Docker 管理器 3.x
2. 下载 Portainer 汉化文件，放入 `/www/wwwroot/docker.data/portainer/public/` 目录
3. 连上 SSH, 安装 Portainer Web UI , 部分命令根据自己实际情况操作
4. 宝塔域名反向代理 `http://127.0.0.1:19999` 到 `domain.com`
5. 访问 `http://domain.com` 进入 Portainer Web UI 管理面板
6. 根据提示设置 `admin` 密码
7. 宝塔添加站点，域名：`docker.data` , PHP 版本：`纯静态`, 其余默认，提交
8. 宝塔添加站点，域名：`docker.volumes` , PHP 版本：`纯静态`, 其余默认，提交

*第 2 步可以通过下面的 shell 命令快速创建目录*
*第 7,8 步是为了可以方便的进入容器存放数据的目录，相当于快捷方式*

### 命令参考：

```bash
# 宝塔面板Centos安装命令
yum install -y wget && wget -O install.sh http://download.bt.cn/install/install_6.0.sh && sh install.sh
```

```bash
# 宿主机创建容器目录
mkdir -p /www/wwwroot/docker.volumes/
mkdir -p /www/wwwroot/docker.data/portainer/public/
```

```bash
# 下载Portainer汉化文件
curl -L https://dl.quchao.net/Soft/Portainer-CN.zip -o /www/wwwroot/docker.data/portainer/Portainer-CN.zip
```

```bash
# 解压Portainer汉化文件
unzip /www/wwwroot/docker.data/portainer/Portainer-CN.zip -d /www/wwwroot/docker.data/portainer/public
```

```bash
# 设置宿主机容器目录权限
chown -R www:www /www/wwwroot/docker.data/portainer
chown -R www:www /www/wwwroot/docker.volumes/
```

*PS: 相对于 Docker 来说，Centos 系统是它的宿主机*

```bash
# 创建容器目录软连接
ln -s -n /var/lib/docker/volumes /www/wwwroot/docker.volumes/
```

```bash
# 创建容器存储卷
docker volume create portainer_data
```

```bash
# 拉取镜像
docker pull portainer/portainer:linux-amd64-1.20.2
```

```bash
# 创建Portainer容器
docker run -d -p 19998:8000 -p 19999:9000 \
--name=portainer --restart=always \
-v /var/run/docker.sock:/var/run/docker.sock \
-v portainer_data:/data \
-v /www/wwwroot/docker.data/portainer/public:/public \
portainer/portainer:linux-amd64-1.20.2
```

#### 汉化文件下载地址
* https://www.quchao.net/Portainer-CN.html

### 修改 Docker 国内镜像源
* https://yeasy.gitbook.io/docker_practice/install/mirror



