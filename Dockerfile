#
# Node基础环境 Dockerfile
#
# https://github.com/ibbd/dockerfile-node
#
# sudo docker build -t ibbd/node ./
#

# Pull base image.
#FROM node:10.16-slim
FROM node:10-slim

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# Define working directory.
WORKDIR /var/www

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 终端设置
ENV TERM xterm

# 解决时区问题
ENV TZ "Asia/Shanghai"
