{application, 'autocluster', [
	{description, "Forms RabbitMQ clusters using a variety of backends (AWS EC2, DNS, Consul, Kubernetes, etc)"},
	{vsn, "0.9.0+4.g0e7899d"},
	{modules, ['autocluster','autocluster_app','autocluster_aws','autocluster_backend','autocluster_cleanup','autocluster_config','autocluster_consul','autocluster_dns','autocluster_etcd','autocluster_httpc','autocluster_k8s','autocluster_log','autocluster_periodic','autocluster_sup','autocluster_util']},
	{registered, [autocluster_sup,autocluster_app,autocluster_sup,autocluster_cleanup]},
	{applications, [kernel,stdlib,rabbit_common,rabbitmq_aws]},
	{mod, {autocluster_app, []}},
	{env, []}
]}.