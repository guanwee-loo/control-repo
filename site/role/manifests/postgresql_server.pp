# @summary Setup a vanilla postgresql server 
#
# Install a PostgreSQL server instance
#
# @example
#   include role::postgresql_server
class role::postgresql_server (
  $version = 12,
){

  #https://noobient.com/2019/11/26/postgresql-on-centos-8-and-rhel-8/
  exec { 'dnf -y module disable postgresql':
    refreshonly => true,
    path        => ['/usr/bin'],
  }
  class { 'postgresql::globals':
    manage_package_repo => true,
    version             => String($version),
    notify              => Exec['dnf -y module disable postgresql'],
  }
  class { 'postgresql::server':
    require => Class['postgresql::globals'],
  }
}
