# 大前端开发环境构建

构建本地前端的node开发环境，包括Python, Gulp，webpack, react-tools, Jasmine等众多前端开发和测试使用的工具. 

- 镜像地址：https://hub.docker.com/r/ibbd/node-dev

说明：本镜像不含sass和compass，因为这两者需要ruby的环境，而把ruby环境打包到该镜像，会导致该镜像太大了，构建耗时太久而且容易出错。如果需要可以使用子镜像：`ibbd/node-dev-ruby`

## 基础说明 

- 基础镜像：node:4.1-slim
- 使用阿里云的source.list
- npm使用淘宝的源
- Python2.7
- git-core (安装component时需要)

## 已经安装的扩展

- Gulp
- webpack
- babel
- mocha
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
- react-ui-builder

## 镜像 

- 从Dockerfile构建：`./build.sh`，构建之前确保先运行`./download.sh`下载阿里云的sources.list文件。
- 从hub.docker.com获取：`docker pull ibbd/node-dev`

## 运行镜像

- `./run.sh`


