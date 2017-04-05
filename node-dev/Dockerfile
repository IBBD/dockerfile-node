#
# Node-dev开发镜像 Dockerfile
#
# https://github.com/ibbd/dockerfile-node/node-dev
#
# sudo docker build -t ibbd/node-dev ./
#

# Pull base image.
FROM ibbd/node

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# apt-get install
# git: component插件需要
# python: node-sass需要
RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        python \
    && rm -rf /var/lib/apt/lists/*

# install 
# 使用淘宝的npm镜像
# 前端有时需要python的环境，而且npm安装的某些插件也需要
# babel:    https://babeljs.io/docs/setup/
# react:    https://facebook.github.io/react/docs/getting-started.html
# mocha:    http://mochajs.org/
# eslint:   https://github.com/eslint/eslint
# ghooks:   https://www.npmjs.com/package/ghooks
# jasmine:  https://github.com/jasmine/jasmine-npm
# react-tools: 提供jsx命令，能将jsx编译为javascript
# react-ui-builder: reactjs组件的可视化构建工具. 执行react-ui-builder, 在浏览器打开http://localhost:2222/builder 
# less:     提供lessc命令，less脚本编译器
# duo:      安装不成功，暂时不用这个
# antd-init: http://ant.design/docs/getting-started , antd是蚂蚁金服开放的react组件库, 这个是其命令行工具
#     && npm install -g cnpm --registry=https://registry.npm.taobao.org \
        #duo \
RUN \
    npm install -g \
        jasmine \
        yo \
        karma karma-cli \
        babel \
        bower \
        browserify \
        component \
        mocha \
        eslint \
        react-tools \
        less \
        react-ui-builder \
        node-sass \
        antd \
        dva-cli \
        create-react-app \
        react-apollo

# 替换为淘宝的镜像
#RUN npm install -g cnpm --registry=https://registry.npm.taobao.org

