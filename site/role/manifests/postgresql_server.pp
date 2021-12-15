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
  exec { 'dnf --disablerepo AppStream':
    creates => '/tmp/disablerepo',
    path    => ['/usr/bin'],
    before  => Class['postgresql::globals'],

  }
  class { 'postgresql::globals':
    version             => String($version),
  }
  class { 'postgresql::server': 
    require => Class['postgresql::globals'],
  }
}
