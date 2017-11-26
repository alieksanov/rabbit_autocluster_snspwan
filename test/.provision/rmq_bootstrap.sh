#!/usr/bin/env bash

# set SELinux to Permissive
sudo setenforce Permissive

sudo yum install epel-release -y

# handy pkgs
HANDY_PKG="net-tools bind-utils tcpdump vim"
sudo yum install -y ${HANDY_PKG}

# download nginx srpm and nginx-module-vts source
cd /tmp
sudo yum install erlang -y
curl -O http://www.rabbitmq.com/releases/rabbitmq-server/v3.5.3/rabbitmq-server-3.5.3-1.noarch.rpm
sudo rpm --import https://www.rabbitmq.com/rabbitmq-signing-key-public.asc
sudo yum install rabbitmq-server-3.5.3-1.noarch.rpm -y

# python client lib
DEV_PKG="python2-pika.noarch"
sudo yum install -y ${DEV_PKG}

sudo systemctl start rabbitmq-server
sudo rabbitmq-plugins enable rabbitmq_management

sudo rabbitmqctl add_user user1 passwd1
sudo rabbitmqctl set_user_tags user1 administrator
sudo rabbitmqctl set_permissions -p / user1 ".*" ".*" ".*"

