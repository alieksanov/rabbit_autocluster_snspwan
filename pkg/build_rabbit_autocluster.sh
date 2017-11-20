
fpm -s dir -t rpm \
	--rpm-summary "Deploys RabbitMQ systemd-nspawn instance for Rabbit autocluster" \
	-n "rabbit_autocluster" -v 0.1 /usr/lib/systemd/system/rabbit-autocluster.service /var/lib/machines/rabbit_autocluster

