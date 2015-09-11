#
# Node-dev Dockerfile
#
# https://github.com/ibbd/dockerfile-node-dev
#
# sudo docker build -t ibbd/node-dev ./
#

# Pull base image.
FROM node:0.12-slim

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

RUN mkdir -p /var/www

# sources.list
# git clone git@github.com:IBBD/docker-compose.git
# 如果导致apt-get Install不成功，可以先注释这句
ADD ext/sources.list   /etc/apt/sources.list

# install git 
# 因为前端比较多同事使用windows
RUN apt-get update \
    && apt-get install -y git \
        vim \
    && rm -rf /var/lib/apt/lists/* 

# 使用淘宝的npm镜像
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org

# install 
# glup:     https://github.com/gulpjs/gulp/blob/master/docs/getting-started.md
# webpack:  http://webpack.github.io/docs/installation.html
# babel:    https://babeljs.io/docs/setup/
# react:    https://facebook.github.io/react/docs/getting-started.html
# intern:   https://theintern.github.io/intern/
# mocha:    http://mochajs.org/
# eslint:   https://github.com/eslint/eslint
# ghooks:   https://www.npmjs.com/package/ghooks
RUN npm install --global gulp \
    && npm install webpack -g \
    && npm install -g babel \
    && npm install intern \
    && npm install -g mocha \
    && npm install -g eslint \
    && npm install ghooks --save-dev

# Define working directory.
WORKDIR /var/www

# 解决时区问题
env TZ "Asia/Shanghai"

# Define default command.
#CMD ["nginx"]

# Expose ports.
#EXPOSE 80

