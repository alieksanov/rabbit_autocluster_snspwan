
yum localinstall consul_rabbit-0.1-1.x86_64.rpm rabbit-autocluster-0.1-1.x86_64.rpm -y

systemctl enable consul-rabbit
systemctl enable rabbit-autocluster

# ensure
cat << EOFC > /usr/lib/systemd/system/consul-rabbit.service
[Unit]
Description=Consul_for_Rabbit_Autocluster
After=syslog.target network.target

[Service]
Type=notify
NotifyAccess=all
TimeoutStartSec=3600
Restart=on-failure
RestartSec=10
ExecStart=/usr/bin/systemd-nspawn -D /var/lib/machines/consul_rabbit -M consul_rabbit  /bin/consul agent -config-dir /consul/config -ui
ExecStop=machinectl terminate consul_rabbit
SuccessExitStatus=69

[Install]
WantedBy=multi-user.target
EOFC

cat <<EOFR > /usr/lib/systemd/system/rabbit-autocluster.service
[Unit]
Description=RabbitMQ_Autocluster_Node
After=syslog.target network.target

[Service]
Type=notify
NotifyAccess=all
TimeoutStartSec=3600
Restart=on-failure
RestartSec=10
ExecStart=/usr/bin/systemd-nspawn --setenv "RABBITMQ_USE_LONGNAME=true" -D /var/lib/machines/rabbit_autocluster --bind-ro /etc/resolv.conf -M rabbitsensu-2-002.shared.adm.las1.mz-inc.com /launch.sh /usr/lib/rabbitmq/sbin/rabbitmq-server
ExecStop=machinectl terminate rabbitsensu-2-002.shared.adm.las1.mz-inc.com
SuccessExitStatus=69

[Install]
WantedBy=multi-user.target
EOFR

systemctl daemon-reload

ln -s /var/lib/machines/consul_rabbit* /var/lib/machines/consul_rabbit
ln -s /var/lib/machines/rabbit_autocluster* /var/lib/machines/rabbit_autocluster


cat <<EOFCC > /var/lib/machines/consul_rabbit/consul/config/config.json
{
  "bind_addr": "0.0.0.0",
  "client_addr": "0.0.0.0",
  "datacenter": "las1",
  "data_dir": "/consul/data",
  "encrypt": "EXz7LFN8hpQ4id8EDYiFoQ==",
  "log_level": "INFO",
  "enable_syslog": false,
  "enable_debug": true,
  "node_name": "rabbitsensu-2-002.shared.adm.las1.mz-inc.com",
  "server": false,
  "leave_on_terminate": false,
  "skip_leave_on_interrupt": true,
  "rejoin_after_leave": true,
  "retry_join": [
    "10.193.52.110:8301",
    "10.193.52.111:8301",
    "10.193.52.112:8301"
  ]
}
EOFCC

cat <<EOFRC > /var/lib/machines/rabbit_autocluster/usr/lib/rabbitmq/etc/rabbitmq/rabbitmq.config
[
  {
    rabbit,
    [
      {default_vhost,       <<"/">>},
      {default_user,        <<"guest">>},
      {default_pass,        <<"12345">>},
      {default_permissions, [<<".*">>, <<".*">>, <<".*">>]},
      {default_user_tags, [administrator]},

      {loopback_users, []},
      {cluster_partition_handling, autoheal},
      {delegate_count, 64},
      {fhc_read_buffering, false},
      {fhc_write_buffering, false},
      {heartbeat, 60},
      {queue_index_embed_msgs_below, 0},
      {queue_index_max_journal_entries, 8192},
      {queue_master_locator, <<"min-masters">>},

      {log_levels, [{autocluster, debug}, {connection, info}]},

      {vm_memory_high_watermark, 0.8}
    ]
  },

  {
    autocluster,
    [
      {backend, "consul"},
      {consul_host, "localhost"},
      {consul_port, 8500},
      {consul_svc, "rabbitmq"},
      {consul_svc_addr, "rabbitsensu-2-002.shared.adm.las1.mz-inc.com"},
      {autocluster_log_level, debug}
    ]
  }

].
EOFRC

