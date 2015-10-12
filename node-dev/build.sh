#!/bin/bash

# 清除已有的
name=node-dev
sudo docker stop ibbd-$name 
sudo docker rm ibbd-$name 
sudo docker rmi ibbd/$name 

# 重新生成
sudo docker build -t ibbd/$name ./

