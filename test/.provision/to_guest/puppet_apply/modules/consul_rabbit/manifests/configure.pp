
class consul_rabbit::configure (

) inherits consul_rabbit {

  file { '/usr/lib/systemd/system/consul-rabbit.service':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    notify  => Class['consul_rabbit::services'],
    content => template('consul_rabbit/consul-rabbit.service.erb'),
    require => Class['consul_rabbit::packages'],
  }

  file { "/var/lib/machines/consul_rabbit_v$machine_version/consul/config/config.json":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    notify  => Class['consul_rabbit::services'],
    content => template('consul_rabbit/config.json.erb'),
    require => Class['consul_rabbit::packages'],
  }

  file { '/var/lib/machines/consul_rabbit':
    ensure => link,
    target => "/var/lib/machines/consul_rabbit_v$machine_version",
  }

}
