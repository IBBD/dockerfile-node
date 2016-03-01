#
# Node基础环境 Dockerfile
#
# https://github.com/ibbd/dockerfile-node
#
# sudo docker build -t ibbd/node ./
#

# Pull base image.
FROM node:4.3.1-slim

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

RUN mkdir -p /var/www

# sources.list
# git clone git@github.com:IBBD/docker-compose.git
# 如果导致apt-get Install不成功，可以先注释这句
#ADD ext/sources.list   /etc/apt/sources.list

# install 
# 使用淘宝的npm镜像
# glup:     https://github.com/gulpjs/gulp/blob/master/docs/getting-started.md
# webpack:  http://webpack.github.io/docs/installation.html
#     && npm install -g cnpm --registry=https://registry.npm.taobao.org \
#     node-sass
    #&& npm config set strict-ssl false \
    #&& npm config set registry "http://registry.npmjs.org/" \
RUN \
    npm config set strict-ssl false \
    && npm config set registry "http://registry.npmjs.org/" \
    && npm install -g \
        gulp \
        webpack \
        grunt grunt-cli

# Define working directory.
WORKDIR /var/www

# 解决时区问题
env TZ "Asia/Shanghai"


