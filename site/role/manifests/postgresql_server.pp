# @summary Setup a vanilla postgresql server 
#
# Install a PostgreSQL server instance
#
# @example
#   include role::postgresql_server
class role::postgresql_server (
  $version,
){

  #https://noobient.com/2019/11/26/postgresql-on-centos-8-and-rhel-8/
  exec { 'dnf -y module disable postgresql':
    cwd     => '/var/tmp',
    creates => '/var/tmp/disablepostgresql',
    path    => ['/usr/bin'],
    before  => Class['postgresql::globals'],
  }
  class { 'postgresql::globals':
    manage_package_repo => true,
    version             => String($version),
  }
  class { 'postgresql::server':
    require => Class['postgresql::globals'],
  }
}
