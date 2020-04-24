#
# 用于编译阶段
#

# Pull base image.
FROM node:12

MAINTAINER Alex Cai "cyy0523xc@gmail.com"

# Define working directory.
WORKDIR /var/www

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && npm install -g cnpm

# 终端设置
ENV TERM xterm

# 解决时区问题
ENV TZ "Asia/Shanghai"
