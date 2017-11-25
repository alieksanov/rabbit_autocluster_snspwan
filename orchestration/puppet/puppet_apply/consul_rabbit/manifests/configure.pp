
class consul_rabbit::configure (

  $consul_role = $consul_rabbit::params::consul_role,

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

}
