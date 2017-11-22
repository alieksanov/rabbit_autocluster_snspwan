#!/bin/bash

VERSION="0.1"
SNSPAWN_INSTANCE="/var/lib/machines/rabbit_autocluster_v${VERSION}"

fpm -s dir -t rpm \
        --rpm-summary "Deploys Rabbit node with autocluster plugin configured for Consul backend" \
        -n "rabbit-autocluster" -v ${VERSION} /usr/lib/systemd/system/rabbit-autocluster.service ${SNSPAWN_INSTANCE}


