
define rabbit_autocluster::ensure_vhost (

  String $vhost_name,
  Boolean $present = true,

) {

  include rabbit_autocluster
  include rabbit_autocluster::params

  $user = $rabbit_autocluster::params::default_user
  $password = $rabbit_autocluster::params::default_password

  notify{'present': message => $present}
 
  if $present {
    exec { "create_vhost_${vhost_name}":
      command => "curl -s -u ${user}:${password} -XPUT http://localhost:15672/api/vhosts/${vhost_name}",
      unless  => "curl -s -u ${user}:${password} http://localhost:15672/api/vhosts/${vhost_name} | grep ${vhost_name}",
      require => [ Package['rabbit-autocluster'], Service['rabbit-autocluster'], ],
      path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin', '/usr/loca/bin', ],
    } 
  } else {
    exec { "delete_vhost_${vhost_name}":
      command => "curl -s -u ${user}:${password} -XDELETE http://localhost:15672/api/vhosts/${vhost_name}",
      onlyif  => "curl -s -u ${user}:${password} http://localhost:15672/api/vhosts/${vhost_name} | grep ${vhost_name}",
      require => [ Package['rabbit-autocluster'], Service['rabbit-autocluster'], ],
      path    => ['/bin', '/usr/bin', '/sbin', '/usr/sbin', '/usr/loca/bin', ],
    }
  }

}
