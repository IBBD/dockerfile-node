#
# Node基础环境 Dockerfile
#
# https://github.com/ibbd/dockerfile-node
#
# sudo docker build -t ibbd/node ./
#

# Pull base image.
FROM node:6.10-slim

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# install 
# 使用淘宝的npm镜像
# glup:     https://github.com/gulpjs/gulp/blob/master/docs/getting-started.md
# webpack:  http://webpack.github.io/docs/installation.html
#     && npm install -g cnpm --registry=https://registry.npm.taobao.org \
#     node-sass
    #&& npm config set strict-ssl false \
    #&& npm config set registry "http://registry.npmjs.org/" \
RUN \
    mkdir -p /var/www \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        git-core \
    && rm -rf /var/lib/apt/lists/* \
    && npm config set strict-ssl false \
    && npm config set registry "http://registry.npmjs.org/" \
    && npm install -g \
        gulp \
        webpack \
        grunt grunt-cli

# Define working directory.
WORKDIR /var/www

# 解决时区问题
env TZ "Asia/Shanghai"
