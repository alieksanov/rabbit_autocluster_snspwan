
class consul_rabbit (

  $consul_role = $consul_rabbit::params::consul_role,
  $rpm_version = $consul_rabbit::params::rpm_version

) inherits consul_rabbit::params {

  class {'::consul_rabbit::packages':} ~> 
  class {'::consul_rabbit::configure':} ~>
  class {'::consul_rabbit::services':} 

}
