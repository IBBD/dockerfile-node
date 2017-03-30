# 前端镜像构建


镜像结构：

- node: 基础镜像, 包含主要的构建工具
- node-dev: 开发镜像，主要增加测试工具等，继承于node
- node-dev-ruby: 增加ruby，sass及compass等工具，继承于node-dev 

## 修改记录

- 2017-03-29 增加`yarn`包管理工具和`create-react-app`, 在`node-dev`中
- 2017-03-26 版本更新为6.10 LTS，在`node-dev`增加`dev-cli`
- 2015-06-26 版本改为4.4
- 2016-06-14 nodejs的版本更新到4.4.5 LTS, git移到node镜像，优化镜像层级
- 2016-01-26 nodejs的版本更新到4.2.6 LTS
- 2016-01-07 在node-dev镜像中增加`antd`（蚂蚁金服开源的组件库）的开发者工具

## 大前端基础环境构建

构建本地前端的node环境，主要是加速npm及安装常用构建工具，如gulp，webpack，grunt等。

- Github:   https://github.com/ibbd/dockerfile-node 
- 镜像地址：https://hub.docker.com/r/ibbd/node

### 基础说明 

- 基础镜像：node:4.4.5-slim

### 已经安装的扩展

- Gulp
- webpack
- grunt, grunt-cli

### 镜像 

- 从hub.docker.com获取：`docker pull ibbd/node`

### 运行镜像

- `./run.sh`


