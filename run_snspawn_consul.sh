
systemd-nspawn -D ./tmp/consul_rabbit -M consul_auto2 
# /bin/consul agent -config-dir /consul/config -ui



#  --setenv="AUTOCLUSTER_TYPE=consul" \
#  --setenv="AUTOCLUSTER_DELAY=60" \
#  --setenv="CONSUL_HOST=rabbit_auto2" \
#  --setenv="CONSUL_SVC_ADDR_AUTO=true" \
#  --setenv="AUTOCLUSTER_CLEANUP=true" \
#  --setenv="CLEANUP_WARN_ONLY=false" \
#  --setenv="CONSUL_DEREGISTER_AFTER=60"


