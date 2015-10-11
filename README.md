# 大前端开发环境构建

构建本地前端的node开发环境，包括Python, Gulp，webpack, react-tools, Jasmine等众多前端开发和测试使用的工具. 

- 镜像地址：https://hub.docker.com/r/ibbd/node-dev

## 基础说明 

- 基础镜像：node:0.12-slim
- 使用阿里云的source.list
- Python2.7
- git-core (安装component时需要)

## 已经安装的扩展

- Gulp
- webpack
- babel
- intern
- mocha
- eslint
- ghooks
- bower 
- grunt
- browserify
- component
- duo
- react-tools
- yeoman
- Jasmine
- Karma
- less
- node-sass

## 镜像 

- 从Dockerfile构建：`./build.sh`，构建之前确保先运行`./download.sh`下载阿里云的sources.list文件。
- 从hub.docker.com获取：`docker pull ibbd/node-dev`

## 运行镜像

- `./run.sh`


