# 大前端基础环境构建

构建本地前端的node环境，主要是加速npm及安装常用构建工具，如gulp，webpack，grunt等。

- Github:   https://github.com/ibbd/dockerfile-node 
- 镜像地址：https://hub.docker.com/r/ibbd/node

## 基础说明 

- 基础镜像：node:4.1-slim
- 使用阿里云的source.list
- npm使用淘宝的源

## 已经安装的扩展

- Gulp
- webpack
- grunt, grunt-cli

## 镜像 

- 从Dockerfile构建：`./build.sh`，构建之前确保先运行`./download.sh`下载阿里云的sources.list文件。
- 从hub.docker.com获取：`docker pull ibbd/node`

## 运行镜像

- `./run.sh`


