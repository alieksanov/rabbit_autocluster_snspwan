#!/usr/bin/env bash

# set SELinux to Permissive
sudo setenforce Permissive

#sudo yum install epel-release -y

# handy pkgs
HANDY_PKG="net-tools bind-utils tcpdump vim"
#sudo yum install -y ${HANDY_PKG}

# download nginx srpm and nginx-module-vts source


# python client lib
DEV_PKG="python2-pika.noarch createrepo"
#sudo yum install -y ${DEV_PKG}


echo $@ >> /tmp/number

sudo mkdir -p /opt/projects/rabbit_autocluster_snspwan/pkg/local_yum_repo/el7/x86_64
sudo cp ./from_host/*.rpm /opt/projects/rabbit_autocluster_snspwan/pkg/local_yum_repo/el7/x86_64/
sudo createrepo /opt/projects/rabbit_autocluster_snspwan/pkg/local_yum_repo/el7/x86_64
sudo cp ./from_host/local.repo /etc/yum.repos.d/

sudo yum install puppet-agent -y

sudo cat <<EOF > /etc/hosts
192.168.50.121 rmq001
192.168.50.122 rmq002
192.168.50.123 rmq003
EOF

sudo chmod 755 ./from_host/puppet_apply/apply.sh


