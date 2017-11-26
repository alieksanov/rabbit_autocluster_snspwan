#!/bin/bash

/opt/puppetlabs/bin/puppet apply --modulepath=./from_host/puppet_apply/modules ./from_host/puppet_apply/node.pp

#puppet apply --modulepath=./modules -l /tmp/manifest.log node.pp


