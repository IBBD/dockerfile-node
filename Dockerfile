#
# Node-dev Dockerfile
#
# https://github.com/ibbd/dockerfile-node-dev
#
# sudo docker build -t ibbd/node-dev ./
#

# Pull base image.
FROM node:4.1-slim

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

RUN mkdir -p /var/www

# sources.list
# git clone git@github.com:IBBD/docker-compose.git
# 如果导致apt-get Install不成功，可以先注释这句
ADD ext/sources.list   /etc/apt/sources.list

# apt-get install
RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        apt-transport-https \
        curl \
        libssl-dev \
        libyaml-dev \
        git-core \
        python \
        bzip2 \
        procps \
        zlib1g-dev \

# install 
# 使用淘宝的npm镜像
# 前端有时需要python的环境，而且npm安装的某些插件也需要
# glup:     https://github.com/gulpjs/gulp/blob/master/docs/getting-started.md
# webpack:  http://webpack.github.io/docs/installation.html
# babel:    https://babeljs.io/docs/setup/
# react:    https://facebook.github.io/react/docs/getting-started.html
# intern:   https://theintern.github.io/intern/
# mocha:    http://mochajs.org/
# eslint:   https://github.com/eslint/eslint
# ghooks:   https://www.npmjs.com/package/ghooks
# jasmine:  https://github.com/jasmine/jasmine-npm
#     && npm install -g cnpm --registry=https://registry.npm.taobao.org \
#     node-sass
    #&& npm config set strict-ssl false \
    #&& npm config set registry "http://registry.npmjs.org/" \
    #&& npm install intern \
    #&& npm install ghooks --save-dev \
RUN \
    buildDeps='autoconf gcc make g++ build-essential' \
    && set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends $buildDeps \
    && npm install -g \
        gulp \
        webpack \
        jasmine \
        yo \
        karma karma-cli \
        grunt grunt-cli \
        babel \
        bower \
        browserify \
        component \
        duo \
        mocha \
        eslint \
        react-tools \
        less \
        react-ui-builder \
    && apt-get purge -y --auto-remove $buildDeps \
    && rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /var/www

# 解决时区问题
env TZ "Asia/Shanghai"


