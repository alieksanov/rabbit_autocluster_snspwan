#!/bin/bash

VERSION="0.1"
SNSPAWN_INSTANCE="/var/lib/machines/consul_rabbit_v${VERSION}"

fpm -s dir -t rpm \
        --rpm-summary "Deploys Consul systemd-nspawn instance for Rabbit autocluster version: ${VERSION}" \
        -n "consul_rabbit" -v ${VERSION} /usr/lib/systemd/system/consul-rabbit.service ${SNSPAWN_INSTANCE}


