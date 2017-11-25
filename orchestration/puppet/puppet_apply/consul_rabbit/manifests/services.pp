
class consul_rabbit::services () {

  service { 'consul-rabbit':
    ensure  => running,
    require => Class['consul_rabbit::packages'],
  }

}

