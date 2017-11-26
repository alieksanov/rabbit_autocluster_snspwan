
class rabbit_autocluster::services () {

  service { 'rabbit-autocluster':
    ensure  => running,
    require => Class['rabbit_autocluster::packages'],
  }

}

