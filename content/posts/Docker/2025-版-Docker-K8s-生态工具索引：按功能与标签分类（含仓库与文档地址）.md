---
title: "2025 版 Docker K8s 生态工具索引：按功能与标签分类（含仓库与文档地址）"
date: 2025-11-14T08:22:46+08:00
draft: false
categories: ["Docker"]
tags: ["docker", "kubernetes", "容器", "编排", "工具索引"]
slug: "2025-edition-docker-k8s-ecosystem-tools-index-by-function-and-tag"
---

# Docker/Kubernetes 生态工具分类索引与标签速查（2025 版）

  

## 说明

- 每个工具被归入“唯一主类目”，若具备跨领域特性，以标签体现。

- 标签为 5-10 个中文关键词，按贴合度排序，统一以 # 前缀标示。

  

## 目录

- [容器引擎与运行时](#容器引擎与运行时)
- [镜像构建与优化](#镜像构建与优化)
- [镜像仓库与注册表](#镜像仓库与注册表)
- [编排与集群](#编排与集群)
- [反向代理与网关](#反向代理与网关)
- [网络与网络插件](#网络与网络插件)
- [服务网格与流量治理](#服务网格与流量治理)
- [安全、隔离与供应链](#安全、隔离与供应链)
- [监控、日志与可视化](#监控、日志与可视化)
- [开发环境与本地工具](#开发环境与本地工具)
- [CI/CD 与持续交付、测试](#cicd-与持续交付、测试)
- [PaaS 与平台管理](#paas-与平台管理)
- [存储与数据管理](#存储与数据管理)
- [服务发现与配置](#服务发现与配置)
- [操作系统与不可变基础设施](#操作系统与不可变基础设施)
- [其他与辅助工具](#其他与辅助工具)
- [CLI 速查](#cli-速查)
- [历史与兼容性](#历史与兼容性)
- [术语解释](#术语解释)


## 容器引擎与运行时

  

### Docker

- 用途：用于创建、部署和管理容器化应用程序的开源平台。

- 项目地址：https://github.com/moby/moby

- 文档：https://docs.docker.com/

- 标签：#Docker #容器引擎 #容器化 #镜像 #运行时 #跨平台 #DevOps #生态

  

### Containerd

- 用途：高性能的容器运行时，管理容器生命周期，是 Kubernetes 与 Docker 的基础组件。

- 项目地址：https://github.com/containerd/containerd

- 文档：https://containerd.io/

- 标签：#容器运行时 #OCI #高性能 #Kubernetes #Docker 基础 #API #可扩展

  

### runc

- 用途：OCI 运行时，负责创建、启动、管理容器，常与 containerd 搭配。

- 项目地址：https://github.com/opencontainers/runc

- 文档：https://github.com/opencontainers/runc#readme

- 标签：#OCI #运行时 #容器生命周期 #Linux #轻量 #标准化

  

### Podman

- 用途：兼容 Docker 的容器管理工具，无守护进程，支持 rootless 模式。

- 项目地址：https://github.com/containers/podman

- 文档：https://podman.io/docs/

- 标签：#容器引擎 #rootless #Docker 兼容 #CLI #Linux #安全隔离

  

### nerdctl

- 用途：containerd 的 Docker 兼容 CLI，支持镜像、容器与 Compose。

- 项目地址：https://github.com/containerd/nerdctl

- 文档：https://github.com/containerd/nerdctl#readme

- 标签：#CLI #containerd #Docker 兼容 #Compose 支持 #镜像管理 #运行与构建

  

### Kubelet

- 用途：Kubernetes 节点代理，负责容器生命周期与节点管理。

- 文档：https://kubernetes.io/docs/reference/command-line-tools-reference/kubelet/

- 标签：#Kubernetes #节点 #运行时接口 #容器生命周期 #调度执行 #健康管理

  

### CRI-O

- 用途：Kubernetes 原生容器运行时，提供精简稳定的 CRI 实现。

- 项目地址：https://github.com/cri-o/cri-o

- 文档：https://cri-o.io/

- 标签：#容器运行时 #CRI #Kubernetes #OCI #稳定

  

### crun

- 用途：高性能的 OCI 容器运行时实现，常作为 runc 的轻量替代。

- 项目地址：https://github.com/containers/crun

- 文档：https://github.com/containers/crun#readme

- 标签：#OCI 运行时 #高性能 #轻量 #Podman 兼容 #替代 runc

  

---

  

## 镜像构建与优化

  

### Dockerfile

- 用途：定义容器镜像构建过程的文本规范。

- 文档：https://docs.docker.com/engine/reference/builder/

- 标签：#镜像构建 #Dockerfile #层缓存 #多阶段构建 #最佳实践 #可复用

  

### Docker Build

- 用途：按照 Dockerfile 构建镜像的命令。

- 文档：https://docs.docker.com/build/

- 标签：#构建命令 #镜像标签 #上下文 #缓存 #构建参数

  

### Buildx

- 用途：扩展构建能力（跨架构/多平台），基于 BuildKit。

- 项目地址：https://github.com/docker/buildx

- 文档：https://docs.docker.com/buildx/overview/

- 标签：#跨架构 #多平台 #BuildKit #高性能构建 #并行 #缓存

  

### BuildKit

- 用途：现代化高性能构建引擎，支持并行、缓存、LLB 前端等。

- 项目地址：https://github.com/moby/buildkit

- 文档：https://docs.docker.com/build/buildkit/

- 标签：#构建引擎 #并行 #增量构建 #LLB #缓存 #远程前端

### Kaniko

- 用途：无 Docker 守护环境下构建镜像，适用于 Kubernetes 与 CI/CD。

- 项目地址：https://github.com/GoogleContainerTools/kaniko

- 标签：#无守护 #Kubernetes #CI/CD #容器内构建 #安全 #云原生

  

### img

- 用途：rootless 镜像构建，基于 BuildKit，可替代 docker build。

- 项目地址：https://github.com/genuinetools/img

- 标签：#rootless #BuildKit #镜像构建 #安全 #轻量

  

### Buildah

- 用途：不依赖 Docker 引擎的镜像构建工具。

- 项目地址：https://github.com/containers/buildah

- 文档：https://buildah.io/

- 标签：#镜像构建 #OCI #脚本化 #无守护 #兼容性

  

### Hadolint

- 用途：Dockerfile Linter，检查语法与最佳实践。

- 项目地址：https://github.com/hadolint/hadolint

- 文档：https://hadolint.github.io/hadolint/

- 标签：#Dockerfile #Linter #最佳实践 #安全 #CI 集成

  

### Dockle

- 用途：镜像安全与最佳实践检查（硬化）。

- 项目地址：https://github.com/goodwithtech/dockle

- 标签：#镜像安全 #硬化 #最佳实践 #合规 #扫描

  

### Dive

- 用途：镜像层分析，可视化层内容与体积占比，辅助瘦身。

- 项目地址：https://github.com/wagoodman/dive

- 标签：#镜像分析 #层结构 #体积优化 #可视化 #调试

  

### docker-slim

- 用途：自动瘦身镜像并提升安全性。

- 项目地址：https://github.com/docker-slim/docker-slim

- 文档：https://docs.dockerslim.com/

- 标签：#镜像瘦身 #最小化 #安全强化 #分析优化 #运行时探测

  

### Earthly

- 用途：通用、可复用的容器化构建工具，跨语言与多项目。

- 项目地址：https://github.com/earthly/earthly

- 文档：https://earthly.dev/get-started

- 标签：#通用构建 #缓存 #可移植 #多语言 #CI 集成 #声明式

  

### Pack (Cloud Native Buildpacks)

- 用途：基于 Buildpacks 将源码自动构建为镜像，无需 Dockerfile。

- 项目地址：https://github.com/buildpacks/pack

- 文档：https://buildpacks.io/docs/tools/pack/

- 标签：#Buildpacks #无 Dockerfile #自动构建 #云原生 #可复用

  

### ko

- 用途：面向 Go 应用的极速镜像构建与推送，无需 Dockerfile，适合直接部署到 K8s。

- 项目地址：https://github.com/ko-build/ko

- 文档：https://ko.build/

- 标签：#Go #快速构建 #无 Dockerfile #K8s 部署 #开发效率

  

### Bazel rules_docker

- 用途：在 Bazel 构建系统中生成与管理容器镜像，实现可重复与可审计的构建。

- 项目地址：https://github.com/bazelbuild/rules_docker

- 文档：https://github.com/bazelbuild/rules_docker#readme

- 标签：#Bazel #容器镜像 #可重复构建 #CI 集成 #可扩展

  

### Nydus

- 用途：新型镜像格式与分发加速，支持按需加载与去重，提升启动与拉取性能。

- 项目地址：https://github.com/dragonflyoss/nydus

- 文档：https://github.com/dragonflyoss/nydus#readme

- 标签：#镜像格式 #按需加载 #性能 #分发加速 #生产

  

---

  

## 镜像仓库与注册表

  

### Docker Hub

- 用途：官方公共/私有镜像仓库。

- 官网：https://hub.docker.com/

- 文档：https://docs.docker.com/docker-hub/

- 标签：#镜像仓库 #公共镜像 #组织管理 #自动构建 #分发

  

### Docker Registry

- 用途：私有/公共的镜像存储，支持推送/拉取。

- 项目地址：https://github.com/distribution/distribution

- 文档：https://docs.docker.com/registry/

- 标签：#Registry #私有仓库 #镜像存储 #API #分层

  

### Harbor

- 用途：企业级镜像仓库，支持 RBAC、漏洞扫描、复制、签名与审计。

- 项目地址：https://github.com/goharbor/harbor

- 文档：https://goharbor.io/docs/

- 标签：#企业级 #RBAC #漏洞扫描 #镜像复制 #内容签名 #审计

  

### Docker Registry UI (Joxit)

- 用途：Docker Registry 的 Web 可视化 UI。

- 项目地址：https://github.com/Joxit/docker-registry-ui

- 文档：https://joxit.dev/docker-registry-ui/

- 标签：#RegistryUI #镜像浏览 #搜索 #管理 #可视化

  

### ORAS

- 用途：将通用工件（非镜像）推送到 OCI Registry。

- 项目地址：https://github.com/oras-project/oras

- 文档：https://oras.land/docs/

- 标签：#OCI 工件 #artifact #推送拉取 #供应链 #通用分发

  

### regctl / regclient

- 用途：现代化的注册表 CLI/库，支持复制与策略。

- 项目地址：https://github.com/regclient/regclient

- 标签：#RegistryCLI #镜像复制 #策略 #自动化 #脚本化

  

### imgpkg (Carvel)

- 用途：OCI 镜像/层打包与分发，支持 Bundle。

- 项目地址：https://github.com/vmware-tanzu/carvel-imgpkg

- 文档：https://carvel.dev/imgpkg/docs/latest/

- 标签：#打包 #Bundle #分发 #Carvel #OCI

  

### Skopeo

- 用途：镜像复制/验证，远程操作 Registry。

- 项目地址：https://github.com/containers/skopeo

- 文档：https://github.com/containers/skopeo#readme

- 标签：#镜像复制 #远程操作 #验证 #Registry #安全

  

### go-containerregistry (crane/ggcr)

- 用途：用 Go 操作容器镜像与 Registry 的库/CLI。

- 项目地址：https://github.com/google/go-containerregistry

- 标签：#Go 库 #镜像操作 #Registry #开发者工具 #CLI

  

### Quay Registry

- 用途：Red Hat 企业级镜像仓库，支持高可用、镜像扫描与多租户管理。

- 项目地址：https://github.com/quay/quay

- 文档：https://docs.redhat.com/en/documentation/red_hat_quay

- 标签：#企业级 #镜像仓库 #高可用 #安全扫描 #多租户

  

### Dragonfly

- 用途：P2P 镜像与文件分发系统，提升跨集群拉取速度并降低 Registry 压力。

- 项目地址：https://github.com/dragonflyoss/Dragonfly2

- 文档：https://d7y.io/docs/

- 标签：#P2P 分发 #加速 #跨集群 #高并发 #镜像分发

  

### Amazon ECR

- 用途：AWS 托管的容器镜像服务，支持私有仓库、扫描与跨区域复制。

- 官网：https://aws.amazon.com/ecr/

- 文档：https://docs.aws.amazon.com/AmazonECR/latest/userguide/what-is-ecr.html

- 标签：#镜像仓库 #云服务 #安全扫描 #生命周期策略 #跨区域复制

  

### Google Container Registry (GCR)

- 用途：Google Cloud 的镜像仓库服务，支持权限管理与多区域存储。

- 官网：https://cloud.google.com/container-registry

- 文档：https://cloud.google.com/container-registry/docs

- 标签：#镜像仓库 #云服务 #权限管理 #多区域 #兼容 OCI

  

### Azure Container Registry (ACR)

- 用途：Azure 托管的容器镜像仓库，支持地理复制与安全扫描。

- 官网：https://azure.microsoft.com/products/container-registry

- 文档：https://learn.microsoft.com/azure/container-registry/

- 标签：#镜像仓库 #云服务 #RBAC #地理复制 #安全扫描

  

---

  

## 编排与集群

  

### Docker Compose

- 用途：用 YAML 定义与管理多容器应用的编排工具。

- 项目地址：https://github.com/docker/compose

- 文档：https://docs.docker.com/compose/

- 标签：#编排 #多容器 #YAML #服务栈 #网络与卷 #开发部署

  

### Docker Swarm

- 用途：Docker 原生编排，管理容器集群与服务部署。

- 项目地址：https://github.com/docker/swarmkit

- 文档：https://docs.docker.com/engine/swarm/

- 标签：#集群编排 #服务发现 #滚动更新 #负载均衡 #原生 Docker

  

### Kubernetes

- 用途：自动化部署、扩缩与管理容器化应用的编排平台。

- 项目地址：https://github.com/kubernetes/kubernetes

- 文档：https://kubernetes.io/docs/

- 标签：#容器编排 #声明式 #自动扩缩 #服务发现 #生态 #多云

  

### Kubeadm

- 用途：初始化/加入/升级 Kubernetes 集群的工具。

- 文档：https://kubernetes.io/docs/reference/setup-tools/kubeadm/

- 标签：#集群初始化 #节点加入 #升级 #自动化 #安装

  

### Kubectl

- 用途：Kubernetes CLI，管理与操作集群资源。

- 文档：https://kubernetes.io/docs/reference/kubectl/

- 标签：#K8sCLI #资源管理 #调试 #脚本化 #自动化

  

### Helm

- 用途：K8s 包管理工具（Charts），支持部署与升级。

- 项目地址：https://github.com/helm/helm

- 文档：https://helm.sh/docs/

- 标签：#包管理 #Chart #模板化 #发布 #回滚 #生态

  

### Minikube

- 用途：本地单节点 K8s，适合开发与测试。

- 项目地址：https://github.com/kubernetes/minikube

- 文档：https://minikube.sigs.k8s.io/docs/

- 标签：#本地 K8s #开发测试 #虚拟机 #跨平台 #轻量

  

### K3s

- 用途：轻量级 Kubernetes，适合边缘计算与低资源环境。

- 项目地址：https://github.com/k3s-io/k3s

- 文档：https://docs.k3s.io/

- 标签：#轻量 K8s #边缘计算 #低资源 #嵌入式 #快速部署

  

### kind

- 用途：在 Docker 中运行 K8s 集群，用于本地测试与 CI。

- 项目地址：https://github.com/kubernetes-sigs/kind

- 文档：https://kind.sigs.k8s.io/

- 标签：#K8s 集群 #Docker 中运行 #CI #测试 #快速

  

### k3d

- 用途：在 Docker 中快速运行 k3s。

- 项目地址：https://github.com/k3d-io/k3d

- 文档：https://k3d.io/

- 标签：#k3s #Docker 中运行 #轻量 #开发 #快速集群

  

### Rancher

- 用途：企业级 K8s 管理平台，多集群与策略统一运维。

- 项目地址：https://github.com/rancher/rancher

- 文档：https://rancher.com/docs/

- 标签：#K8s 管理 #多集群 #RBAC #策略 #应用目录 #企业级

  

### Nomad

- 用途：HashiCorp 的编排调度器，支持 Docker/Podman 等运行时。

- 项目地址：https://github.com/hashicorp/nomad

- 文档：https://developer.hashicorp.com/nomad/docs

- 标签：#编排 #作业调度 #多运行时 #批处理 #混合环境

  

### Liveness Probe

- 用途：K8s 存活探针，确保容器存活与自愈。

- 文档：https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/

- 标签：#健康检查 #自愈 #稳定性 #探针 #K8s

  

### Readiness Probe

- 用途：K8s 就绪探针，控制流量仅进入已就绪容器。

- 文档：https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/

- 标签：#就绪检查 #流量控制 #稳定性 #探针 #K8s

  

### Kustomize

- 用途：声明式叠加与定制 Kubernetes 资源，无需模板引擎。

- 项目地址：https://github.com/kubernetes-sigs/kustomize

- 文档：https://kubectl.docs.kubernetes.io/guides/introduction/kustomize/

- 标签：#声明式 #配置叠加 #环境差异 #纯 YAML #kubectl 集成

  

### Argo CD

- 用途：GitOps 持续交付，将 Git 作为单一事实源实现声明式部署与回滚。

- 项目地址：https://github.com/argoproj/argo-cd

- 文档：https://argo-cd.readthedocs.io/

- 标签：#GitOps #持续交付 #回滚 #可视化 #多集群

  

### Flux

- 用途：云原生 GitOps 引擎，自动同步 Git 声明到集群，支持 Kustomize/Helm。

- 项目地址：https://github.com/fluxcd/flux2

- 文档：https://fluxcd.io/docs/

- 标签：#GitOps #声明式 #自动同步 #Kustomize #Helm

  

### KEDA

- 用途：K8s 事件驱动自动扩缩，支持多种事件源与按需伸缩。

- 项目地址：https://github.com/kedacore/keda

- 文档：https://keda.sh/docs/

- 标签：#自动扩缩 #事件驱动 #HPA 集成 #云服务触发 #成本优化

  

### Knative

- 用途：K8s 上的无服务器与事件驱动平台，简化构建、部署与扩缩。

- 项目地址：https://github.com/knative/serving

- 文档：https://knative.dev/docs/

- 标签：#Serverless #事件驱动 #自动扩缩 #K8s #微服务

  

---

  

## 反向代理与网关

  

### Traefik

- 用途：现代反向代理与负载均衡，原生支持 Docker 服务发现与动态路由。

- 项目地址：https://github.com/traefik/traefik

- 文档：https://doc.traefik.io/traefik/

- 标签：#反向代理 #负载均衡 #服务发现 #Docker 集成 #LetsEncrypt #路由

  

### nginx-proxy（jwilder）

- 用途：基于容器标签自动生成 Nginx 配置，实现动态路由与虚拟主机。

- 项目地址：https://github.com/jwilder/nginx-proxy

- 标签：#Nginx #自动配置 #虚拟主机 #Docker 标签 #反向代理

  

### Nginx Proxy Manager

- 用途：图形化反向代理管理（集成 Let’s Encrypt）。

- 项目地址：https://github.com/NginxProxyManager/nginx-proxy-manager

- 文档：https://nginxproxymanager.com/

- 标签：#WebUI #反向代理 #HTTPS #证书管理 #自托管

  

### Caddy

- 用途：现代 Web 服务器与反向代理，自动 HTTPS。

- 项目地址：https://github.com/caddyserver/caddy

- 文档：https://caddyserver.com/docs/

- 标签：#自动 HTTPS #反向代理 #Web 服务器 #扩展 #容器友好

  

### caddy-docker-proxy

- 用途：根据容器标签自动生成 Caddy 配置与证书。

- 项目地址：https://github.com/lucaslorentz/caddy-docker-proxy

- 标签：#Caddy #自动配置 #标签驱动 #动态路由 #HTTPS

  

### Envoy Proxy

- 用途：高性能 L7 代理与服务网格数据平面，支持丰富路由与可观测性。

- 项目地址：https://github.com/envoyproxy/envoy

- 文档：https://www.envoyproxy.io/docs/envoy/latest/

- 标签：#代理 #负载均衡 #服务网格 #可观测性 #高性能

  

### HAProxy

- 用途：经典高性能反向代理与负载均衡，适合高并发场景。

- 项目地址：https://github.com/haproxy/haproxy

- 文档：https://www.haproxy.org/documentation/

- 标签：#反向代理 #负载均衡 #高并发 #稳定 #生产

  

### Kong Gateway

- 用途：API 网关，支持插件扩展、认证与流量治理。

- 项目地址：https://github.com/Kong/kong

- 文档：https://docs.konghq.com/gateway/

- 标签：#API 网关 #插件 #认证 #流量治理 #扩展性

  

### Gloo Edge

- 用途：基于 Envoy 的云原生 API 网关与流量管理平台。

- 项目地址：https://github.com/solo-io/gloo

- 文档：https://docs.solo.io/gloo-edge/latest/

- 标签：#API 网关 #Envoy #流量管理 #云原生 #可扩展

  

### NGINX Ingress Controller

- 用途：K8s 官方 NGINX Ingress 控制器，提供集群入口路由与负载均衡。

- 项目地址：https://github.com/kubernetes/ingress-nginx

- 文档：https://kubernetes.github.io/ingress-nginx/

- 标签：#Ingress #K8s 入口 #Nginx #负载均衡 #路由

  

### Contour

- 用途：基于 Envoy 的 K8s Ingress 控制器，提供高级路由与多租户支持。

- 项目地址：https://github.com/projectcontour/contour

- 文档：https://projectcontour.io/

- 标签：#Ingress #Envoy #路由 #多租户 #K8s

  

### Emissary Ingress (Ambassador)

- 用途：基于 Envoy 的 Kubernetes Ingress 控制器与 API 网关，支持高级路由与安全策略。

- 项目地址：https://github.com/emissary-ingress/emissary

- 文档：https://www.getambassador.io/docs/emissary/latest/

- 标签：#Ingress #API 网关 #Envoy #路由 #K8s

  
### Kong Ingress Controller

- 用途：Kong 的 Kubernetes Ingress 控制器，为集群入口提供路由、认证与策略治理，结合 Kong Gateway 提供丰富插件生态。

- 项目地址：https://github.com/Kong/kubernetes-ingress-controller

- 文档：https://docs.konghq.com/kubernetes-ingress-controller/

- 标签：#Ingress #K8s 入口 #Kong #API 网关 #路由

  

---

  

## 网络与网络插件

  

### Docker Network

- 用途：创建、管理与调试容器网络。

- 文档：https://docs.docker.com/engine/reference/commandline/network/

- 标签：#容器网络 #桥接 #覆盖网络 #DNS #隔离 #调试

  

### Netshoot

- 用途：网络诊断工具集的容器镜像。

- 项目地址：https://github.com/nicolaka/netshoot

- 标签：#网络诊断 #排障 #工具箱 #容器镜像 #TCP/IP

  

### Pipework

- 用途：为容器配置高级网络（桥接/VLAN/绑定）。

- 项目地址：https://github.com/jpetazzo/pipework

- 文档：https://github.com/jpetazzo/pipework#readme

- 标签：#自定义网络 #桥接 #VLAN #二层三层 #拓扑

  

### CNI (Container Network Interface)

- 用途：容器网络插件的标准接口。

- 项目地址：https://github.com/containernetworking/cni

- 文档：https://www.cni.dev/docs/

- 标签：#网络插件标准 #可插拔 #K8s #配置 #生态

  

### Weave Net

- 用途：简化容器网络与多主机连接，支持加密与策略。

- 项目地址：https://github.com/weaveworks/weave

- 文档：https://www.weave.works/docs/net/latest/overview/

- 标签：#覆盖网络 #多主机 #加密 #策略 #易用

  

### Calico

- 用途：高性能容器网络与网络策略实现。

- 项目地址：https://github.com/projectcalico/calico

- 文档：https://projectcalico.docs.tigera.io/

- 标签：#网络策略 #BGP #高性能 #K8s #可扩展

  

### Flannel

- 用途：简单易用的覆盖网络，适合 Kubernetes。

- 项目地址：https://github.com/flannel-io/flannel

- 标签：#覆盖网络 #VXLAN #K8s #轻量 #易部署

  

### Cilium

- 用途：基于 eBPF 的高性能容器网络与安全策略，实现细粒度可观测与控制。

- 项目地址：https://github.com/cilium/cilium

- 文档：https://docs.cilium.io/en/stable/

- 标签：#eBPF #网络策略 #高性能 #可观测性 #K8s

  

### Multus CNI

- 用途：为 Pod 提供多网络接口的 CNI 插件，适合 NFV/多网卡场景。

- 项目地址：https://github.com/k8snetworkplumbingwg/multus-cni

- 文档：https://multus-cni.gitbook.io/multus-cni/

- 标签：#多网络 #CNI #NFV #高级网络 #K8s

  

### kube-router

- 用途：基于路由/BGP 的 K8s 网络方案，集成网络策略与服务代理。

- 项目地址：https://github.com/cloudnativelabs/kube-router

- 文档：https://github.com/cloudnativelabs/kube-router#readme

- 标签：#BGP #网络路由 #网络策略 #服务代理 #轻量

  

### MetalLB

- 用途：K8s 的裸机负载均衡实现，提供 L2/L3 模式的外部 IP 分配。

- 项目地址：https://github.com/metallb/metallb

- 文档：https://metallb.universe.tf/

- 标签：#负载均衡 #裸机 #外部 IP #L2L3 #网络

  

### CoreDNS

- 用途：可扩展 DNS 服务器，作为 K8s 默认集群 DNS，支持自定义插件。

- 项目地址：https://github.com/coredns/coredns

- 文档：https://coredns.io/

- 标签：#DNS #K8s #可扩展 #插件 #服务发现

  

---

  

## 服务网格与流量治理

  

### Istio

- 用途：服务网格平台，提供微服务通信管理、安全与可观测性。

- 项目地址：https://github.com/istio/istio

- 文档：https://istio.io/latest/docs/

- 标签：#服务网格 #流量管理 #零信任 #可观测性 #策略 #Sidecar

  

### Linkerd

- 用途：轻量高性能的服务网格，强调简洁与安全，易于在生产环境部署。

- 项目地址：https://github.com/linkerd/linkerd2

- 文档：https://linkerd.io/docs/

- 标签：#服务网格 #轻量 #性能 #零信任 #易用

  

### Kuma

- 用途：基于 Envoy 的多平台服务网格，支持 K8s 与虚拟机混合环境。

- 项目地址：https://github.com/kumahq/kuma

- 文档：https://kuma.io/docs/

- 标签：#服务网格 #Envoy #多平台 #混合环境 #策略

  

---

  

## 安全、隔离与供应链

  

### Docker Bench for Security

- 用途：依据安全基线检查 Docker 主机与配置的最佳实践。

- 项目地址：https://github.com/docker/docker-bench-security

- 标签：#安全基线 #审计 #最佳实践 #主机安全 #合规

  

### Trivy

- 用途：容器与文件系统漏洞扫描，支持 OS 包/依赖/IaC。

- 项目地址：https://github.com/aquasecurity/trivy

- 文档：https://aquasecurity.github.io/trivy/

- 标签：#漏洞扫描 #容器镜像 #文件系统 #IaC #数据库来源 #快速

  

### Grype

- 用途：容器镜像漏洞扫描，支持从 SBOM 扫描。

- 项目地址：https://github.com/anchore/grype

- 标签：#漏洞扫描 #SBOM #镜像安全 #数据库 #集成

  

### Syft

- 用途：生成 SBOM（CycloneDX/SPDX），支持镜像与文件系统。

- 项目地址：https://github.com/anchore/syft

- 标签：#SBOM #供应链 #CycloneDX #SPDX #清单 #合规

  

### Clair

- 用途：镜像漏洞静态分析，支持多发行版。

- 项目地址：https://github.com/quay/clair

- 标签：#漏洞扫描 #静态分析 #发行版数据库 #镜像安全 #可集成

  

### Notary

- 用途：Docker 内容信任（镜像签名与验证）。

- 项目地址：https://github.com/notaryproject/notary

- 文档：https://notaryproject.dev/

- 标签：#内容信任 #签名 #验证 #供应链安全 #不可抵赖

  

### gVisor

- 用途：Google 的容器沙箱运行时，提供更强隔离与安全。

- 项目地址：https://github.com/google/gvisor

- 文档：https://gvisor.dev/docs/

- 标签：#沙箱运行时 #隔离 #安全 #兼容性 #用户态内核

  

### Kata Containers

- 用途：轻量虚拟化容器，兼具 VM 隔离与容器效率。

- 项目地址：https://github.com/kata-containers/kata-containers

- 文档：https://katacontainers.io/docs/

- 标签：#轻量虚拟化 #隔离 #安全 #性能 #VM 容器

  

### Falco

- 用途：容器/主机运行时威胁检测（eBPF/规则）。

- 项目地址：https://github.com/falcosecurity/falco

- 文档：https://falco.org/docs/

- 标签：#运行时安全 #威胁检测 #eBPF #规则 #告警

  

### docker-socket-proxy

- 用途：代理并细粒度控制 Docker API 访问，降低风险。

- 项目地址：https://github.com/Tecnativa/docker-socket-proxy

- 文档：https://github.com/Tecnativa/docker-socket-proxy#readme

- 标签：#API 代理 #最小权限 #安全隔离 #访问控制 #集成

  

### Authelia

- 用途：开源 SSO/2FA 登录门户，为自托管服务提供前置认证。

- 项目地址：https://github.com/authelia/authelia

- 文档：https://www.authelia.com/

- 标签：#SSO #2FA #访问控制 #反向代理集成 #ACL #身份验证

  

### Cowrie

- 用途：交互式 SSH/Telnet 蜜罐，容器化部署便捷。

- 项目地址：https://github.com/cowrie/cowrie

- 文档：https://docs.cowrie.org/

- 标签：#蜜罐 #安全研究 #会话记录 #文件捕获 #容器镜像

  

### cosign（sigstore）

- 用途：容器镜像与工件的签名与验证，集成供应链透明日志（Rekor）。

- 项目地址：https://github.com/sigstore/cosign

- 文档：https://docs.sigstore.dev/cosign/overview/

- 标签：#签名 #验证 #供应链 #透明日志 #OCI

  

### OPA Gatekeeper

- 用途：在 K8s 上以策略（OPA/RegO）约束与验证集群资源。

- 项目地址：https://github.com/open-policy-agent/gatekeeper

- 文档：https://open-policy-agent.github.io/gatekeeper/website/

- 标签：#策略 #合规 #OPA #准入控制 #K8s

  

### Kyverno

- 用途：K8s 原生策略引擎，使用 YAML 编写规则进行验证/修改/生成。

- 项目地址：https://github.com/kyverno/kyverno

- 文档：https://kyverno.io/docs/

- 标签：#策略 #准入控制 #K8s 原生 #YAML #合规

  

### HashiCorp Vault

- 用途：集中式密钥与机密管理，支持动态凭据与审计。

- 项目地址：https://github.com/hashicorp/vault

- 文档：https://developer.hashicorp.com/vault/docs

- 标签：#密钥管理 #机密 #动态凭据 #审计 #集成

  

### Sealed Secrets (bitnami)

- 用途：通过公钥加密 Kubernetes Secret，安全存储在 Git 中并在集群端解密。

- 项目地址：https://github.com/bitnami-labs/sealed-secrets

- 文档：https://github.com/bitnami-labs/sealed-secrets#readme

- 标签：#GitOps #Secret 加密 #公钥 #K8s #安全存储

  

### External Secrets Operator

- 用途：将外部秘密管理系统（AWS/GCP/Vault 等）同步到 K8s Secret。

- 项目地址：https://github.com/external-secrets/external-secrets

- 文档：https://external-secrets.io/

- 标签：#Secrets 同步 #外部集成 #K8s #云服务 #自动化

  

### Mozilla SOPS

- 用途：对 YAML/JSON 等配置进行加密，常与 GitOps 工具结合管理敏感信息。

- 项目地址：https://github.com/mozilla/sops

- 文档：https://github.com/mozilla/sops#usage

- 标签：#配置加密 #GitOps #多后端 #密钥管理 #集成

  

### Kyverno Policy Sets

- 用途：社区维护的 Kyverno 策略集合，覆盖安全/合规/最佳实践的可直接使用规则。

- 项目地址：https://github.com/kyverno/policies

- 文档：https://kyverno.io/policies/

- 标签：#Kyverno #策略库 #合规 #最佳实践 #K8s

  

---

  

## 监控、日志与可视化

  

### Prometheus

- 用途：指标采集/查询的开源监控系统。

- 项目地址：https://github.com/prometheus/prometheus

- 文档：https://prometheus.io/docs/

- 标签：#监控 #时序数据库 #指标 #告警 #拉取模型

  

### Grafana

- 用途：可视化监控数据，提供仪表板与告警。

- 项目地址：https://github.com/grafana/grafana

- 文档：https://grafana.com/docs/

- 标签：#可视化 #仪表板 #告警 #插件 #数据源

  

### Fluentd

- 用途：统一日志收集与路由。

- 项目地址：https://github.com/fluent/fluentd

- 文档：https://docs.fluentd.org/

- 标签：#日志收集 #路由 #聚合 #插件 #Elastic/K8s

  

### cAdvisor

- 用途：收集并展示容器资源与性能数据。

- 项目地址：https://github.com/google/cadvisor

- 标签：#容器指标 #性能 #数据源 #监控管道 #可视化

  

### Weave Scope

- 用途：自动拓扑发现并可视化容器、进程与主机关系与流量。

- 项目地址：https://github.com/weaveworks/scope

- 标签：#拓扑 #可视化 #实时监控 #流量分析 #交互

  

### Netdata

- 用途：即时系统/容器监控，自动发现并告警。

- 项目地址：https://github.com/netdata/netdata

- 文档：https://learn.netdata.cloud/docs/

- 标签：#系统监控 #容器监控 #告警 #实时 #易用

  

### Logspout

- 用途：将容器日志路由至多种后端（syslog/HTTP 等）。

- 项目地址：https://github.com/gliderlabs/logspout

- 标签：#日志路由 #后端输出 #轻量 #集成 #网络

  

### Dozzle

- 用途：实时 Docker 日志 Web 查看器，支持搜索/过滤。

- 项目地址：https://github.com/amir20/dozzle

- 文档：https://dozzle.dev/

- 标签：#Web 日志 #流式 #搜索 #过滤 #多容器

  

### OpenTelemetry Collector

- 用途：统一采集与转发指标/日志/追踪的可扩展代理，支持多种后端。

- 项目地址：https://github.com/open-telemetry/opentelemetry-collector

- 文档：https://opentelemetry.io/docs/collector/

- 标签：#OpenTelemetry #采集代理 #指标日志追踪 #可扩展 #后端兼容

  

### Jaeger

- 用途：分布式追踪系统，帮助定位微服务性能瓶颈与调用链问题。

- 项目地址：https://github.com/jaegertracing/jaeger

- 文档：https://www.jaegertracing.io/docs/latest/

- 标签：#分布式追踪 #可视化 #性能分析 #调用链 #OpenTracing

  

### Zipkin

- 用途：轻量分布式追踪系统，收集与展示调用链路时延。

- 项目地址：https://github.com/openzipkin/zipkin

- 文档：https://zipkin.io/pages/quickstart.html

- 标签：#分布式追踪 #轻量 #调用链 #性能分析 #可视化

  

### Loki

- 用途：按标签索引的日志系统，优化与 Prometheus/Grafana 集成。

- 项目地址：https://github.com/grafana/loki

- 文档：https://grafana.com/docs/loki/latest/

- 标签：#日志 #标签索引 #Grafana 集成 #云原生 #可扩展

  

### Fluent Bit

- 用途：高性能日志采集器，轻量占用与多后端输出。

- 项目地址：https://github.com/fluent/fluent-bit

- 文档：https://docs.fluentbit.io/

- 标签：#日志采集 #轻量 #高性能 #多后端 #K8s 集成

  

### Vector

- 用途：统一的高性能日志与事件管道，支持转换与路由。

- 项目地址：https://github.com/vectordotdev/vector

- 文档：https://vector.dev/docs/

- 标签：#日志管道 #事件 #转换路由 #高性能 #可观测性

  

### Elasticsearch

- 用途：分布式搜索与分析引擎，常用于日志与指标索引。

- 项目地址：https://github.com/elastic/elasticsearch

- 文档：https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html

- 标签：#搜索 #日志索引 #分布式 #分析 #ELK

  

### Kibana

- 用途：Elastic 的数据可视化平台，提供仪表板与探索分析。

- 项目地址：https://github.com/elastic/kibana

- 文档：https://www.elastic.co/guide/en/kibana/current/index.html

- 标签：#可视化 #仪表板 #日志分析 #ELK #探索

  

### kube-state-metrics

- 用途：将 K8s 对象状态暴露为 Prometheus 指标，便于集群健康监控。

- 项目地址：https://github.com/kubernetes/kube-state-metrics

- 文档：https://github.com/kubernetes/kube-state-metrics/tree/master/docs

- 标签：#指标 #K8s 状态 #Prometheus #监控 #可观测性

  

### Prometheus Operator

- 用途：以声明式方式在 K8s 管理 Prometheus/Alertmanager 等组件及配置。

- 项目地址：https://github.com/prometheus-operator/prometheus-operator

- 文档：https://prometheus-operator.dev/

- 标签：#Operator #Prometheus #Alertmanager #声明式 #K8s

  

### Grafana Tempo

- 用途：高可扩展的分布式追踪后端，优化采集与存储成本，深度集成 Grafana/OTel。

- 项目地址：https://github.com/grafana/tempo

- 文档：https://grafana.com/docs/tempo/latest/

- 标签：#分布式追踪 #后端存储 #OTel 集成 #可扩展 #云原生

  

### OpenSearch

- 用途：分布式搜索与分析引擎，支持日志/指标/安全分析等场景。

- 项目地址：https://github.com/opensearch-project/OpenSearch

- 文档：https://opensearch.org/docs/latest/

- 标签：#搜索分析 #日志索引 #分布式 #可观测性 #生态

  

### OpenSearch Dashboards

- 用途：OpenSearch 的可视化与探索界面，提供仪表板、搜索与分析能力。

- 项目地址：https://github.com/opensearch-project/OpenSearch-Dashboards

- 文档：https://opensearch.org/docs/latest/dashboards/

- 标签：#可视化 #仪表板 #日志分析 #OpenSearch #探索

 
### Kubevious

- 用途：Kubernetes 应用中心的可视化与校验套件，直观展示关系与配置问题，帮助保障集群健康。

- 项目地址：https://github.com/kubevious/kubevious

- 文档：https://docs.kubevious.io/

- 标签：#K8s #可视化 #配置校验 #拓扑关系 #易用 UI

 

---

  

## 开发环境与本地工具

  

### Docker CLI

- 用途：与 Docker 引擎交互的命令行工具。

- 项目地址：https://github.com/docker/cli

- 文档：https://docs.docker.com/engine/reference/commandline/
 
- 平台：Windows / macOS / Linux；WSL2 支持

- 标签：#CLI #容器管理 #镜像操作 #网络与卷 #脚本化 #自动化

  

### Colima（macOS）

- 用途：基于 Lima 的容器运行环境，轻量替代 Docker Desktop。

- 项目地址：https://github.com/abiosoft/colima

- 标签：#本地容器 #macOS #轻量 #替代方案 #虚拟化

- 平台：macOS；通过 Lima 提供 Linux VM

  

### Rancher Desktop

- 用途：桌面版容器与 K8s 开发环境。

- 项目地址：https://github.com/rancher-sandbox/rancher-desktop

- 文档：https://docs.rancherdesktop.io/

- 标签：#桌面 #K8s #容器管理 #跨平台 #镜像管理

- 平台：Windows / macOS / Linux；WSL2 集成

  

### Podman Desktop

- 用途：Podman 官方桌面应用，图形化容器管理。

- 项目地址：https://github.com/containers/podman-desktop

- 文档：https://podman-desktop.io/docs

- 标签：#桌面 #容器管理 #rootless #Compose 集成 #扩展

- 平台：Windows / macOS / Linux

  

### Lando

- 用途：本地开发环境自动化工具，提供一致服务栈。

- 项目地址：https://github.com/lando/lando

- 文档：https://docs.lando.dev/

- 标签：#本地开发 #自动化 #一致性栈 #Web 开发 #工作流

- 平台：Windows / macOS / Linux

  

### Docksal

- 用途：跨平台开发环境，提供复用栈与命令工具。

- 项目地址：https://github.com/docksal/docksal

- 文档：https://docs.docksal.io/

- 标签：#开发环境 #跨平台 #命令工具 #可复用 #Docker 化

- 平台：Windows / macOS / Linux

  

### Devilbox

- 用途：现代 LAMP/LEMP 开发栈，面向 PHP/JS 的本地环境。

- 项目地址：https://github.com/cytopia/devilbox

- 文档：https://devilbox.readthedocs.io/

- 标签：#LAMP #LEMP #本地开发 #PHP #JavaScript #容器栈

- 平台：Windows / macOS / Linux

  

### Dev Containers CLI

- 用途：Dev Container 规范 CLI，构建/运行开发容器。

- 项目地址：https://github.com/devcontainers/cli

- 文档：https://containers.dev/

- 标签：#DevContainer #开发容器 #规范 #VSCode #环境复现

- 平台：Windows / macOS / Linux；WSL2/VS Code 集成

  

### LazyDocker

- 用途：交互式终端 UI，管理容器/卷/网络/日志。

- 项目地址：https://github.com/jesseduffield/lazydocker

- 标签：#终端 UI #管理 #日志 #卷 #网络 #监控

- 平台：Windows / macOS / Linux；WSL2 兼容

  

### Dry

- 用途：终端管理 Docker/Compose，便捷查看与操作。

- 项目地址：https://github.com/moncho/dry

- 标签：#终端工具 #Compose #容器管理 #状态查看 #便捷

- 平台：Windows / macOS / Linux

  

### Docker Compose UI

- 用途：Web 界面执行与监控 Compose 项目。

- 项目地址：https://github.com/francescou/docker-compose-ui

- 标签：#WebUI #Compose #监控 #执行 #轻量

- 平台：Windows / macOS / Linux

  

### DockSTARTer

- 用途：基于 Compose 的家用服务启动器与模板集合。

- 项目地址：https://github.com/GhostWriters/DockSTARTer

- 文档：https://dockstarter.com/

- 标签：#家用服务 #模板 #一键部署 #Compose #自托管

- 平台：Linux 优先；macOS/Windows（WSL2）

  

### Whalebrew

- 用途：让镜像像本地命令一样运行，容器化 CLI。

- 项目地址：https://github.com/whalebrew/whalebrew

- 文档：https://github.com/whalebrew/whalebrew#readme

- 标签：#容器化 CLI #命令别名 #Homebrew 体验 #开发者工具 #易用

- 平台：Linux / macOS；Windows（WSL2）

  

### DevPod

- 用途：远程/本地开发容器环境编排，快速在任意基础设施创建可复现开发环境。

- 项目地址：https://github.com/loft-sh/devpod

- 文档：https://devpod.sh/docs

- 标签：#开发容器 #远程开发 #环境复现 #工作空间 #可移植

- 平台：Windows / macOS / Linux；WSL2 支持

  

### Mutagen

- 用途：高性能双向文件同步，优化 Docker for Mac/WSL 的挂载性能。

- 项目地址：https://github.com/mutagen-io/mutagen

- 文档：https://mutagen.io/documentation

- 标签：#文件同步 #性能优化 #开发效率 #跨平台 #Docker 挂载

- 平台：Windows / macOS / Linux；WSL2

  

### docker-sync

- 用途：通过 rsync/Unison 等方式加速 Mac 上的容器文件同步。

- 项目地址：https://github.com/EugenMayer/docker-sync

- 文档：https://docker-sync.io/

- 标签：#Mac 开发 #文件同步 #性能 #Compose 集成 #易用

- 平台：macOS 优先；Windows（WSL）

  

### K9s

- 用途：终端 UI 管理与观测 Kubernetes 资源，提升运维效率。

- 项目地址：https://github.com/derailed/k9s

- 文档：https://k9scli.io/

- 标签：#终端 UI #K8s 管理 #观测 #效率 #运维

- 平台：Windows / macOS / Linux

  

### Lens

- 用途：桌面 K8s 管理与可观测平台，提供多集群可视化与插件生态。

- 项目地址：https://github.com/lensapp/lens

- 文档：https://docs.k8slens.dev/

- 标签：#K8s 桌面 #可视化 #多集群 #插件 #运维

- 平台：Windows / macOS / Linux

  
### DevSpace

- 用途：云原生开发工具，提供容器化开发迭代（构建、同步、端口转发、日志），加速在 Kubernetes 上的开发工作流。

- 项目地址：https://github.com/devspace-sh/devspace

- 文档：https://devspace.sh/docs

- 标签：#K8s 开发 #持续迭代 #文件同步 #端口转发 #工作流

- 平台：Windows / macOS / Linux

  
### Okteto

- 用途：面向 Kubernetes 的云原生开发平台与 CLI，支持远程开发环境、预览环境与自动化工作流。

- 项目地址：https://github.com/okteto/okteto

- 文档：https://www.okteto.com/docs/

- 标签：#开发环境 #云原生 #预览环境 #远程开发 #K8s

- 平台：Windows / macOS / Linux；云服务

  

---

  

## CI/CD 与持续交付、测试

  

### Drone CI

- 用途：容器原生 CI/CD，流水线以容器步骤定义。

- 项目地址：https://github.com/harness/drone

- 文档：https://docs.drone.io/

- 标签：#CI #CD #容器原生 #流水线 #自托管 #扩展

  

### Woodpecker CI

- 用途：轻量 CI，兼容 Drone 流水线语法。

- 项目地址：https://github.com/woodpecker-ci/woodpecker

- 文档：https://woodpecker-ci.org/

- 标签：#CI #轻量 #Drone 兼容 #自托管 #社区驱动

  

### Skaffold

- 用途：持续构建与部署工具，支持 Docker/K8s。

- 项目地址：https://github.com/GoogleContainerTools/skaffold

- 文档：https://skaffold.dev/docs/

- 标签：#持续构建 #持续部署 #K8s #开发迭代 #自动化

  

### Testcontainers

- 用途：测试中按需启动临时容器的库。

- 项目地址：https://github.com/testcontainers/testcontainers-java

- 文档：https://testcontainers.com/

- 标签：#集成测试 #临时容器 #多语言 #隔离 #可控性

  

### container-structure-test

- 用途：对镜像进行结构与行为测试，保障一致性。

- 项目地址：https://github.com/GoogleContainerTools/container-structure-test

- 文档：https://github.com/GoogleContainerTools/container-structure-test#readme

- 标签：#镜像测试 #一致性 #行为验证 #CI 集成 #质量

  

### Kompose

- 用途：将 Compose 转换为 K8s 资源，便于迁移。

- 项目地址：https://github.com/kubernetes/kompose

- 文档：https://kompose.io/

- 标签：#迁移 #转换 #Compose 到 K8s #声明式 #兼容

  

### Watchtower

- 用途：自动更新容器，监控镜像变化并重启。

- 项目地址：https://github.com/containrrr/watchtower

- 标签：#自动化运维 #镜像监控 #更新重启 #守护 #部署维护

  

### Diun

- 用途：镜像更新通知（邮件/Webhook 等）。

- 项目地址：https://github.com/crazy-max/diun

- 文档：https://crazymax.dev/diun/

- 标签：#镜像更新 #通知 #Webhook #自动化 #运维

  

### Tilt

- 用途：本地容器化开发迭代，实时构建与同步。

- 项目地址：https://github.com/tilt-dev/tilt

- 文档：https://docs.tilt.dev/

- 标签：#本地迭代 #实时构建 #同步 #开发流程 #K8s

  

### Tekton Pipelines

- 用途：Kubernetes 原生的 CI/CD 构建流水线框架，基于 CRD 声明任务与编排。

- 项目地址：https://github.com/tektoncd/pipeline

- 文档：https://tekton.dev/docs/pipelines/

- 标签：#K8s 原生 #CI/CD #CRD #声明式 #可扩展

  

### Argo Workflows

- 用途：K8s 上的声明式工作流引擎，支持 DAG/步进执行与大规模批处理。

- 项目地址：https://github.com/argoproj/argo-workflows

- 文档：https://argoproj.github.io/argo-workflows/

- 标签：#工作流 #K8s #声明式 #DAG #批处理

  

### Jenkins X

- 用途：基于 K8s 的 CI/CD 方案，提供 GitOps 交付与自动化环境管理。

- 项目地址：https://github.com/jenkins-x/jx

- 文档：https://jenkins-x.io/docs/

- 标签：#CI/CD #K8s #GitOps #自动化 #开发平台

  

### Concourse CI

- 用途：容器化、声明式流水线的 CI 系统，强调可重复与可移植。

- 项目地址：https://github.com/concourse/concourse

- 文档：https://docs.concourse-ci.org/

- 标签：#CI #流水线 #容器化 #声明式 #可重复

  

---

  

## PaaS 与平台管理

  

### Portainer

- 用途：图形化 Docker 管理，简化容器与集群监控。

- 项目地址：https://github.com/portainer/portainer

- 文档：https://docs.portainer.io/

- 标签：#容器管理 #WebUI #监控 #RBAC #多集群

  

### CapRover

- 用途：一键 PaaS（自托管 Heroku），简化应用部署。

- 项目地址：https://github.com/caprover/caprover

- 文档：https://caprover.com/docs/

- 标签：#PaaS #自托管 #一键部署 #应用管理 #模板

  

### Dokku

- 用途：轻量 PaaS，Heroku 风格的应用部署。

- 项目地址：https://github.com/dokku/dokku

- 文档：https://dokku.com/docs/

- 标签：#PaaS #轻量 #Heroku 风格 #Docker #插件

  

### Coolify

- 用途：自托管 PaaS，支持 Compose 应用与数据库。

- 项目地址：https://github.com/coollabsio/coolify

- 文档：https://coolify.io/docs

- 标签：#PaaS #自托管 #Compose #一站式 #应用与数据库

  

### Yacht

- 用途：现代化 Docker Web UI，支持模板与应用管理。

- 项目地址：https://github.com/SelfhostedPro/Yacht

- 文档：https://yacht.sh/docs/

- 标签：#WebUI #模板 #应用管理 #自托管 #简洁

  

### Swarmpit

- 用途：Docker Swarm 管理 Web UI。

- 项目地址：https://github.com/swarmpit/swarmpit

- 文档：https://swarmpit.io/

- 标签：#Swarm 管理 #WebUI #stacks #services #多主机

  

### 1Panel

- 用途：Linux 服务器运维管理面板，内置容器管理等能力。

- 项目地址：https://github.com/1Panel-dev/1Panel

- 文档：https://1panel.cn/docs/

- 标签：#服务器面板 #容器管理 #站点数据库 #监控 #插件

  

### Dockge

- 用途：面向 compose.yaml 的栈管理器，含编辑器/Web 终端。

- 项目地址：https://github.com/louislam/dockge

- 文档：https://github.com/louislam/dockge#readme

- 标签：#Compose 栈 #编辑器 #Web 终端 #镜像更新 #多主机

  

### OpenShift

- 用途：企业级 Kubernetes 平台，集成运维/安全/开发者工具与应用生命周期管理。

- 项目地址：https://github.com/openshift/origin

- 文档：https://docs.openshift.com/

- 标签：#K8s 平台 #企业级 #安全与运维 #开发者体验 #生命周期管理

  

---

  

## 存储与数据管理

  

### Docker Volume

- 用途：管理持久化存储卷。

- 文档：https://docs.docker.com/engine/reference/commandline/volume/

- 标签：#持久化卷 #数据 #挂载 #备份 #多容器共享

  

### RexRay

- 用途：容器持久化存储管理，支持 EBS/GCE/Ceph 等后端。

- 项目地址：https://github.com/rexray/rexray

- 标签：#持久化存储 #驱动 #云后端 #卷管理 #数据可靠性

  

### Longhorn

- 用途：K8s 原生分布式块存储，提供快照/备份与高可用。

- 项目地址：https://github.com/longhorn/longhorn

- 文档：https://longhorn.io/docs/

- 标签：#块存储 #K8s 原生 #高可用 #快照备份 #运维

  

### OpenEBS

- 用途：K8s 存储引擎集合，支持多种数据引擎与工作负载场景。

- 项目地址：https://github.com/openebs/openebs

- 文档：https://openebs.io/docs

- 标签：#容器存储 #K8s #数据引擎 #灵活 #社区

  

### Rook

- 用途：在 K8s 管理存储系统的 Operator 框架，常用于部署 Ceph。

- 项目地址：https://github.com/rook/rook

- 文档：https://rook.io/docs/rook/latest/

- 标签：#Operator #存储编排 #Ceph #K8s #自动化

  

### Ceph

- 用途：分布式存储系统，提供对象/块/文件多种接口。

- 项目地址：https://github.com/ceph/ceph

- 文档：https://docs.ceph.com/en/latest/

- 标签：#分布式存储 #对象块文件 #高可用 #扩展 #开源

  

### MinIO

- 用途：高性能 S3 兼容对象存储，适合私有云与边缘部署。

- 项目地址：https://github.com/minio/minio

- 文档：https://min.io/docs/minio/linux/index.html

- 标签：#对象存储 #S3 兼容 #高性能 #私有云 #边缘

  
### SeaweedFS

- 用途：高性能分布式对象/文件存储，支持海量小文件与大规模扩展，适合边缘与私有云场景。

- 项目地址：https://github.com/seaweedfs/seaweedfs

- 文档：https://github.com/seaweedfs/seaweedfs#readme

- 标签：#分布式存储 #文件系统 #对象存储 #高性能 #扩展

  
### JuiceFS

- 用途：云原生分布式文件系统，后端使用对象存储，兼容 POSIX，适合大数据与容器编排环境。

- 项目地址：https://github.com/juicedata/juicefs

- 文档：https://juicefs.com/docs

- 标签：#分布式文件系统 #对象存储后端 #POSIX 兼容 #K8s 集成 #高性能

  
### GlusterFS

- 用途：开源分布式文件系统，支持复制、条带化与横向扩展，适合通用存储集群场景。

- 项目地址：https://github.com/gluster/glusterfs

- 文档：https://docs.gluster.org/

- 标签：#分布式文件系统 #复制与条带化 #扩展 #高可用 #开源

  

---

  

## 服务发现与配置

  

### Consul

- 用途：服务发现与配置中心，含健康检查。

- 项目地址：https://github.com/hashicorp/consul

- 文档：https://developer.hashicorp.com/consul/docs

- 标签：#服务发现 #配置中心 #健康检查 #KV #多数据中心

  

### etcd

- 用途：分布式键值存储，常作服务发现与配置后端。

- 项目地址：https://github.com/etcd-io/etcd

- 文档：https://etcd.io/docs/

- 标签：#分布式 KV #一致性 #服务发现 #配置后端 #高可用

  

### Registrator

- 用途：自动将容器服务注册到 Consul/Etcd/Skydns。

- 项目地址：https://github.com/gliderlabs/registrator

- 标签：#自动注册 #服务发现 #Consul #Etcd #Skydns

  

### Nacos

- 用途：阿里开源的服务发现与配置管理平台，支持动态 DNS 与多语言客户端。

- 项目地址：https://github.com/alibaba/nacos

- 文档：https://nacos.io/

- 标签：#服务发现 #配置中心 #多语言 #动态 #生态

  

### Eureka

- 用途：Netflix 的服务注册与发现组件，常与 Spring Cloud 集成。

- 项目地址：https://github.com/Netflix/eureka

- 文档：https://github.com/Netflix/eureka/wiki

- 标签：#服务发现 #注册中心 #SpringCloud #微服务 #经典

  

### Apache ZooKeeper

- 用途：分布式协调服务，提供命名/配置/锁与选举等功能。

- 项目地址：https://github.com/apache/zookeeper

- 文档：https://zookeeper.apache.org/doc/

- 标签：#分布式协调 #配置管理 #锁与选举 #一致性 #生态

  

### Spring Cloud Config

- 用途：集中式配置管理服务，支持 Git 存储与动态刷新。

- 项目地址：https://github.com/spring-cloud/spring-cloud-config

- 文档：https://docs.spring.io/spring-cloud-config/docs/current/reference/html/

- 标签：#配置中心 #Git 后端 #动态刷新 #Spring 生态 #微服务

  

---

  

## 操作系统与不可变基础设施

  

### LinuxKit

- 用途：构建安全、可移植、精简的容器操作系统；以容器组装不可变最小化 Linux 发行版，支持多架构、多平台运行与多种输出格式。

- 项目地址：https://github.com/linuxkit/linuxkit

- 文档：https://github.com/linuxkit/linuxkit/blob/master/docs/architecture.md

- 标签：#工具 #Linux #容器化 #不可变基础设施 #最小化发行版 #多架构 #OS #镜像格式

  

### Talos Linux

- 用途：面向 Kubernetes 的不可变操作系统，声明式配置与安全默认。

- 项目地址：https://github.com/siderolabs/talos

- 文档：https://www.talos.dev/docs/

- 标签：#不可变 OS #K8s 专用 #声明式 #安全 #运维

  

### Bottlerocket

- 用途：AWS 开源的容器主机操作系统，聚焦安全与可管理性。

- 项目地址：https://github.com/bottlerocket-os/bottlerocket

- 文档：https://bottlerocket.dev/

- 标签：#容器主机 #安全 #不可变 #AWS 生态 #自动更新

  

---

  

## 其他与辅助工具

  

### Docker Compose Override（说明项）

- 用途：Compose 的文件叠加机制（override/多文件 -f）。

- 文档：https://docs.docker.com/compose/multiple-compose-files/

- 标签：#配置管理 #环境差异 #多文件叠加 #Compose #声明式

  

### Docker Machine

- 用途：在不同环境创建与管理 Docker 主机。

- 项目地址：https://github.com/docker/machine

- 文档：https://docs.docker.com/machine/

- 标签：#主机管理 #跨环境 #云 #驱动 #自动化

  

### OpenFaaS

- 用途：基于容器的无服务器（Serverless）框架。

- 项目地址：https://github.com/openfaas/faas

- 文档：https://docs.openfaas.com/

- 标签：#Serverless #函数 #Docker #K8s #事件驱动 #PaaS

  

### krew

- 用途：kubectl 插件管理器，便捷安装与管理社区插件。

- 项目地址：https://github.com/kubernetes-sigs/krew

- 文档：https://krew.sigs.k8s.io/docs/

- 标签：#kubectl 插件 #包管理 #扩展 #社区生态 #易用

  

### kubectx / kubens

- 用途：快速切换 K8s 上下文与命名空间的终端工具。

- 项目地址：https://github.com/ahmetb/kubectx

- 文档：https://github.com/ahmetb/kubectx#readme

- 标签：#上下文切换 #命名空间 #终端工具 #效率 #运维

  

### stern

- 用途：按 Pod/label 多路实时聚合 K8s 日志，支持过滤与高亮。

- 项目地址：https://github.com/stern/stern

- 文档：https://github.com/stern/stern#readme

- 标签：#日志聚合 #多 Pod #过滤 #终端 #K8s

  

---

  

## CLI 速查

### Docker Run

- 用途：启动容器并指定运行参数的命令。

- 文档：https://docs.docker.com/engine/reference/commandline/run/

- 标签：#CLI #容器运行 #参数管理 #交互式 #后台进程 #生命周期

  

### Docker Logs

- 用途：查看容器输出日志的命令。

- 文档：https://docs.docker.com/engine/reference/commandline/logs/

- 标签：#日志 #CLI #调试 #流式 #过滤

  

### Docker Stats

- 用途：实时查看容器资源使用情况。

- 文档：https://docs.docker.com/engine/reference/commandline/stats/

- 标签：#资源监控 #CPU #内存 #网络 #实时

  

### Docker Inspect

- 用途：查看容器/镜像/网络/卷等对象的详细信息。

- 文档：https://docs.docker.com/engine/reference/commandline/inspect/

- 标签：#对象信息 #调试 #诊断 #JSON 输出 #元数据

---

## 历史与兼容性

### Tiller (Helm 2)

- 用途：Helm 2 的服务器端组件（Helm 3 已移除）。

- 文档：https://helm.sh/docs/faq/changes_since_helm2/#what-happened-to-tiller

- 标签：#Helm2 #服务器端 #已弃用 #兼容性 #历史

---

## 附注

- Docker Compose CLI 与 Docker Compose Override 已并入 Compose 的说明与用法中，保留条目用于知识完整性与检索。

- 如需将同一工具在次级类目中重复展示，请改用标签进行筛选，不重复归档。

---

## 术语解释

- K8s：Kubernetes 的简称，容器编排平台。
- OCI：Open Container Initiative 标准，镜像/运行时规范。
- CRI：Container Runtime Interface，K8s 调用容器运行时的接口。
- CNI：Container Network Interface，容器网络插件标准。
- Ingress：K8s 集群入口控制器与路由机制。
- GitOps：以 Git 作为单一事实源的声明式交付与回滚方法论。
- SBOM：软件物料清单（CycloneDX/SPDX），记录组件与依赖。
- LLB：BuildKit 的低层构建定义格式，描述并行可缓存的构建图。
- Rootless：无 root 权限运行容器/守护进程的模式。
- Sidecar：伴随主容器的辅助容器，常用于代理/采集等。
- Operator：K8s 上以控制器管理复杂应用的模式与组件。
- RBAC：基于角色的访问控制机制。
- eBPF：可在内核中安全运行的扩展，常用于可观测与安全。


---

## 标签速览索引

@ #Docker #容器引擎 #容器化 #镜像 #运行时 #跨平台 #DevOps #生态 #容器运行时 #OCI #高性能 #Kubernetes #Docker 基础 #API #可扩展 #容器生命周期 #Linux #轻量 #标准化 #rootless #Docker 兼容 #CLI #Compose 支持 #镜像管理 #运行与构建 #容器运行 #参数管理 #交互式 #后台进程 #生命周期 #节点 #运行时接口 #调度执行 #健康管理 #CRI #稳定 #Podman 兼容 #替代 runc #镜像构建 #Dockerfile #层缓存 #多阶段构建 #最佳实践 #可复用 #构建命令 #镜像标签 #上下文 #缓存 #构建参数 #跨架构 #多平台 #BuildKit #高性能构建 #并行 #构建引擎 #增量构建 #LLB #远程前端 #无守护 #CI/CD #容器内构建 #安全 #云原生 #脚本化 #兼容性 #Linter #合规 #扫描 #镜像分析 #层结构 #体积优化 #可视化 #调试 #镜像瘦身 #最小化 #安全强化 #分析优化 #运行时探测 #通用构建 #可移植 #多语言 #声明式 #Buildpacks #自动构建 #K8s 部署 #开发效率 #容器镜像 #可重复构建 #可扩展 #镜像格式 #按需加载 #性能 #分发加速 #生产 #镜像仓库 #公共镜像 #组织管理 #分发 #Registry #私有仓库 #镜像存储 #分层 #企业级 #RBAC #漏洞扫描 #镜像复制 #内容签名 #审计 #RegistryUI #镜像浏览 #搜索 #管理 #OCI 工件 #artifact #推送拉取 #供应链 #通用分发 #RegistryCLI #策略 #自动化 #打包 #Bundle #Carvel #验证 #Go 库 #开发者工具 #高可用 #多租户 #P2P 分发 #加速 #跨集群 #高并发 #生命周期策略 #多区域 #兼容 OCI #编排 #多容器 #YAML #服务栈 #网络与卷 #开发部署 #集群编排 #服务发现 #滚动更新 #负载均衡 #原生 Docker #声明式 #自动扩缩 #生态 #多云 #集群初始化 #节点加入 #升级 #安装 #K8sCLI #资源管理 #调试 #脚本化 #包管理 #Chart #模板化 #发布 #回滚 #本地 K8s #开发测试 #虚拟机 #轻量 K8s #边缘计算 #低资源 #嵌入式 #快速部署 #K8s 集群 #Docker 中运行 #CI #测试 #快速 #k3s #开发 #快速集群 #K8s 管理 #多集群 #策略 #应用目录 #作业调度 #多运行时 #批处理 #混合环境 #Helm2 #已弃用 #历史 #健康检查 #自愈 #稳定性 #探针 #就绪检查 #流量控制 #配置叠加 #环境差异 #纯 YAML #kubectl 集成 #GitOps #持续交付 #回滚 #自动同步 #Kustomize #HPA 集成 #云服务触发 #成本优化 #Serverless #微服务 #反向代理 #服务发现 #Docker 集成 #LetsEncrypt #Nginx #自动配置 #虚拟主机 #Docker 标签 #WebUI #HTTPS #证书管理 #自托管 #Web 服务器 #扩展 #标签驱动 #动态路由 #Envoy #可观测性 #高并发 #稳定 #生产 #API 网关 #插件 #认证 #流量治理 #Ingress #K8s 入口 #路由 #多租户 #多网络 #CNI #NFV #高级网络 #BGP #网络路由 #网络策略 #服务代理 #裸机 #外部 IP #L2L3 #DNS #可扩展 #Sidecar #零信任 #策略 #沙箱运行时 #隔离 #用户态内核 #轻量虚拟化 #VM 容器 #运行时安全 #威胁检测 #eBPF #API 代理 #最小权限 #访问控制 #SSO #2FA #ACL #身份验证 #蜜罐 #安全研究 #会话记录 #文件捕获 #签名 #验证 #透明日志 #准入控制 #K8s 原生 #YAML #密钥管理 #机密 #动态凭据 #审计 #Secret 加密 #公钥 #安全存储 #Secrets 同步 #外部集成 #配置加密 #多后端 #策略库 #指标 #K8s 状态 #Prometheus #Operator #Alertmanager #后端存储 #OTel 集成 #分布式追踪 #调用链 #OpenTracing #标签索引 #ELK #日志管道 #事件 #转换路由 #搜索 #日志索引 #分布式 #数据可视化 #仪表板 #拓扑 #实时监控 #流量分析 #交互 #系统监控 #告警 #终端 UI #状态查看 #家用服务 #模板 #一键部署 #容器化 CLI #命令别名 #Homebrew 体验 #远程开发 #环境复现 #工作空间 #文件同步 #性能优化 #开发效率 #Mac 开发 #Compose 集成 #观测 #效率 #K8s 桌面 #插件 #持续迭代 #端口转发 #预览环境 #迁移 #转换 #一致性 #行为验证 #质量 #Swarm 管理 #stacks #services #多主机 #服务器面板 #站点数据库 #编辑器 #Web 终端 #镜像更新 #K8s 平台 #安全与运维 #开发者体验 #生命周期管理 #持久化卷 #数据 #挂载 #备份 #驱动 #云后端 #卷管理 #数据可靠性 #块存储 #高可用 #快照备份 #容器存储 #数据引擎 #灵活 #存储编排 #Ceph #对象块文件 #扩展 #对象存储 #S3 兼容 #私有云 #边缘 #文件系统 #分布式文件系统 #复制与条带化 #不可变基础设施 #工具 #Linux #OS #镜像格式 #内容信息 #调试 #诊断 #JSON 输出 #元数据 #配置管理 #多文件叠加 #主机管理 #跨环境 #云 #驱动 #函数 #事件驱动 #kubectl 插件 #包管理 #上下文切换 #命名空间 #多 Pod #日志聚合



