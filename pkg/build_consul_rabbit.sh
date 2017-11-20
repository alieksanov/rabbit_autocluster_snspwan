
fpm -s dir -t rpm \
	--rpm-verifyscript ./check_if_installed.sh \
	--rpm-summary "Deploys Consul systemd-nspawn instance for Rabbit autocluster" \
	-n "consul_rabbit" -v 0.1 /usr/lib/systemd/system/consul-rabbit.service /var/lib/machines/consul_rabbit ./check_if_installed.sh

