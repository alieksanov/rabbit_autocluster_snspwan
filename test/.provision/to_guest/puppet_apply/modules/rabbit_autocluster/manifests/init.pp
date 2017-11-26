
class rabbit_autocluster (

  $rpm_version = $rabbit_autocluster::params::rpm_version,
  $machine_version = $rabbit_autocluster::params::machine_version,

) inherits rabbit_autocluster::params {

  class {'::rabbit_autocluster::packages':} ~> 
  class {'::rabbit_autocluster::configure':} ~>
  class {'::rabbit_autocluster::services':} 

}
