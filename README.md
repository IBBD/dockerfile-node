# 大前端开发环境构建

构建本地前端的node开发环境，包括git, vim, Gulp，Ruby，SASS等众多工具。

- 镜像地址：https://hub.docker.com/r/ibbd/node-dev

## 基础说明 

- 基础镜像：node:0.12-slim
- 使用阿里云的source.list
- Ruby2.2.3
- RubyGems镜像和npm镜像使用淘宝的
- 基本开发及文本工具：git, tmux, vim （含spf13-vim）

## 已经安装的扩展

- Gulp
- webpack
- babel
- intern
- mocha
- eslint
- ghooks
- SASS
- Compass

## 镜像 

- 从Dockerfile构建：`sudo ./build.sh`，构建之前确保先运行`./download.sh`下载阿里云的sources.list文件。
- 从hub.docker.com获取：`sudo docker pull ibbd/node-dev`

## 运行镜像

- `sudo ./run.sh`


