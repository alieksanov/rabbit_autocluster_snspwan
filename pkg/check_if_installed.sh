#!/bin/bash

test -d /var/lib/machines/consul_rabbit || rpm -qa | grep -q consul_rabbit && echo "Installed" && return 1
return 0
