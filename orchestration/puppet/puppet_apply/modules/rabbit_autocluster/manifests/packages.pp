
class rabbit_autocluster::packages (

  $rpm_version = $rabbit_autocluster::params::rpm_version

) inherits rabbit_autocluster::params {

  package { 'rabbit-autocluster':
    ensure   => $rpm_version,
  }

}
