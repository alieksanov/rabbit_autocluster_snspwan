
class {'consul_rabbit': 
  rpm_version => '0.1-1',
  consul_role => 'server',
  consul_servers => ['10.138.232.84']
}
->
class {'rabbit_autocluster': 
  rpm_version => '0.1-1',
}
->
rabbit_autocluster::ensure_vhost {'custom':
  present => false,
  vhost_name => 'custom', 
}
