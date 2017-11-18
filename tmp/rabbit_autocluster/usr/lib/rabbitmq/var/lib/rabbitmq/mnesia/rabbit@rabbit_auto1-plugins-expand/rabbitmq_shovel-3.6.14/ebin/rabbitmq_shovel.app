{application, 'rabbitmq_shovel', [
	{description, "Data Shovel for RabbitMQ"},
	{vsn, "3.6.14"},
	{id, ""},
	{modules, ['rabbit_shovel','rabbit_shovel_config','rabbit_shovel_dyn_worker_sup','rabbit_shovel_dyn_worker_sup_sup','rabbit_shovel_parameters','rabbit_shovel_status','rabbit_shovel_sup','rabbit_shovel_util','rabbit_shovel_worker','rabbit_shovel_worker_sup']},
	{registered, [rabbitmq_shovel_sup]},
	{applications, [kernel,stdlib,rabbit_common,rabbit,amqp_client]},
	{mod, {rabbit_shovel, []}},
	{env, [
	    {defaults, [
	        {prefetch_count,     1000},
	        {ack_mode,           on_confirm},
	        {publish_fields,     []},
	        {publish_properties, []},
	        {reconnect_delay,    5}
	      ]}
	  ]},
	{broker_version_requirements, ["3.6.14"]}
]}.