#
# Node Dockerfile
#
# https://github.com/ibbd/dockerfile-node
#
# sudo docker build -t ibbd/node ./
#

# Pull base image.
FROM node:0.12-slim

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

RUN mkdir -p /var/www

# sources.list
# git clone git@github.com:IBBD/docker-compose.git
# 如果导致apt-get Install不成功，可以先注释这句
ADD ext/sources.list   /etc/apt/sources.list

############################################################################
# BEGIN of 安装Ruby
# copy from https://github.com/docker-library/ruby/blob/0cdec78d89e33750a4b796bd2c748f0d5a1ae654/2.2/slim/Dockerfile
############################################################################

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

############################################################################
# END of 安装Ruby
############################################################################

# install sass 
# sass: http://sass-lang.com/documentation/file.SASS_REFERENCE.html
RUN gem install sass \

# install 
# webpack:  http://webpack.github.io/docs/installation.html
# babel:    https://babeljs.io/docs/setup/
# react:    https://facebook.github.io/react/docs/getting-started.html
# intern:   https://theintern.github.io/intern/
# mocha:    http://mochajs.org/
# eslint:   https://github.com/eslint/eslint
RUN npm install --global gulp \
    && npm install webpack -g \
    && npm install -g babel \
    && npm install intern \
    && npm install -g mocha \
    && npm install -g eslint

# Define working directory.
WORKDIR /var/www

# 解决时区问题
env TZ "Asia/Shanghai"

# Define default command.
#CMD ["nginx"]

# Expose ports.
#EXPOSE 80

