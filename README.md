# Node For IBBD

构建本地前端的node开发环境，包括git, Gulp等众多工具。

## 基础说明 

- 基础镜像：node:0.12-slim
- 使用阿里云的source.list
- npm镜像使用淘宝的
- git, vim （开发环境）

## 已经安装的扩展

- Gulp
- webpack
- babel
- intern
- mocha
- eslint
- ghooks

## 镜像 

- 从Dockerfile构建：`sudo ./build.sh`，构建之前确保先运行`./download.sh`下载阿里云的sources.list文件。
- 从hub.docker.com获取：`sudo docker pull ibbd/node-dev`

## 运行镜像

- `sudo ./run.sh`


