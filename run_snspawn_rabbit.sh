
systemd-nspawn -D ./tmp/rabbit_autocluster -M rabbit_auto2 \
  --setenv="AUTOCLUSTER_TYPE=consul" \
  --setenv="AUTOCLUSTER_DELAY=60" \
  --setenv="CONSUL_HOST=rabbit_auto2" \
  --setenv="CONSUL_SVC_ADDR_AUTO=true" \
  --setenv="AUTOCLUSTER_CLEANUP=true" \
  --setenv="CLEANUP_WARN_ONLY=false" \
  --setenv="CONSUL_DEREGISTER_AFTER=60" \
  /launch.sh /usr/lib/rabbitmq/sbin/rabbitmq-server

