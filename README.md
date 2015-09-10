# Node For IBBD

构建本地前端的node开发环境，包括Gulp等众多工具。

## 基础说明 

- 基础镜像：node:0.12-slim
- Ruby 2.2.3
- RubyGems 2.4.8
- 使用阿里云的source.list
- npm镜像和RubyGems镜像都是使用淘宝的
- git

## 已经安装的扩展

- SASS
- Gulp
- webpack
- babel
- intern
- mocha
- eslint
- ghooks

## 镜像 

- 从Dockerfile构建：`sudo ./build.sh`
- 从hub.docker.com获取：`sudo docker pull ibbd/node-dev`

## 运行镜像

- `sudo ./run.sh`


