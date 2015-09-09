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

# Define mountable directories.
#VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/var/log/nginx", "/var/www"]

# 使用自定义配置文件
#COPY conf/nginx.conf     /etc/nginx/nginx.conf

RUN mkdir -p /var/www

# install 
# webpack:  http://webpack.github.io/docs/installation.html
# sass:     http://sass-lang.com/documentation/file.SASS_REFERENCE.html
# babel:    https://babeljs.io/docs/setup/
# react:    https://facebook.github.io/react/docs/getting-started.html
# intern:   https://theintern.github.io/intern/
# mocha:    http://mochajs.org/
# eslint:   https://github.com/eslint/eslint
RUN npm install --global gulp \
    && npm install webpack -g \
    && gem install sass \
    && npm install -g babel \
    && npm install intern \
    && npm install -g mocha \
    && npm install -g eslint

# install sass
# 需要先安装ruby
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
    && curl -sSL https://get.rvm.io | bash -s stable \
    && 

# Define working directory.
WORKDIR /var/www

# 解决时区问题
env TZ "Asia/Shanghai"

# Define default command.
# 加上这个会启动不了
#CMD ["nginx"]

# Expose ports.
#EXPOSE 80

