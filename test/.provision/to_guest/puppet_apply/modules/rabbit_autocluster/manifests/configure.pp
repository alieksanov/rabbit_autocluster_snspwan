
class rabbit_autocluster::configure (

) inherits rabbit_autocluster {

  file { '/usr/lib/systemd/system/rabbit-autocluster.service':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    notify  => Class['rabbit_autocluster::services'],
    content => template('rabbit_autocluster/rabbit-autocluster.service.erb'),
    require => Class['rabbit_autocluster::packages'],
  }

  file { "/var/lib/machines/rabbit_autocluster_v$machine_version/usr/lib/rabbitmq/etc/rabbitmq/rabbitmq.config":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    notify  => Class['rabbit_autocluster::services'],
    content => template('rabbit_autocluster/rabbitmq.config.erb'),
    require => Class['rabbit_autocluster::packages'],
  }

  file { '/var/lib/machines/rabbit_autocluster':
    ensure => link,
    target => "/var/lib/machines/rabbit_autocluster_v$machine_version",
  }

}
