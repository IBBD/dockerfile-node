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
#ADD ext/sources.list   /etc/apt/sources.list

###########################################################
######### BEGIN Ruby环境 ##################################
######### Copy From: hub.docker.com/_/ruby/  2.2-slim  ####
######### 1. 将RubyGems的镜像替换为淘宝的              ####
######### 2. 安装sass                                  ####
######### 3. 安装compass                               ####
###########################################################

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bzip2 \
        ca-certificates \
        curl \
        libffi-dev \
        libgdbm3 \
        libssl-dev \
        libyaml-dev \
        procps \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

ENV RUBY_MAJOR 2.2
ENV RUBY_VERSION 2.2.3
ENV RUBYGEMS_VERSION 2.4.8

# skip installing gem documentation
RUN echo 'install: --no-document\nupdate: --no-document' >> "$HOME/.gemrc"

# some of ruby's build scripts are written in ruby
# we purge this later to make sure our final image uses what we just built
RUN buildDeps=' \
        autoconf \
        bison \
        gcc \
        libbz2-dev \
        libgdbm-dev \
        libglib2.0-dev \
        libncurses-dev \
        libreadline-dev \
        libxml2-dev \
        libxslt-dev \
        make \
        ruby \
    ' \
    && set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends $buildDeps \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /usr/src/ruby \
    && curl -SL "http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.bz2" \
        | tar -xjC /usr/src/ruby --strip-components=1 \
    && cd /usr/src/ruby \
    && autoconf \
    && ./configure --disable-install-doc \
    && make -j"$(nproc)" \
    && make install \
    && gem sources --remove https://rubygems.org/ \
    && gem sources -a https://ruby.taobao.org/ \
    && gem install sass \
    && gem install compass \
    && gem update --system $RUBYGEMS_VERSION \
    && rm -r /usr/src/ruby \
    && apt-get purge -y --auto-remove $buildDeps

# install things globally, for great justice
ENV GEM_HOME /usr/local/bundle
ENV PATH $GEM_HOME/bin:$PATH

ENV BUNDLER_VERSION 1.10.6

RUN gem install bundler --version "$BUNDLER_VERSION" \
    && bundle config --global path "$GEM_HOME" \
    && bundle config --global bin "$GEM_HOME/bin"

# don't create ".bundle" in all our apps
ENV BUNDLE_APP_CONFIG $GEM_HOME

###########################################################
######### END Ruby环境 ####################################
###########################################################

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

