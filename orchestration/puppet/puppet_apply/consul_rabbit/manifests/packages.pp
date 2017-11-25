
class consul_rabbit::packages (

  $rpm_version = $consul_rabbit::params::rpm_version

) inherits consul_rabbit::params {

  package { 'consul_rabbit':
    ensure   => $rpm_version,
  }

}
