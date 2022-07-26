# @summary Setup a vanilla postgresql server 
# Depends on the following module:
#   mod 'puppetlabs-postgresql', '7.5.0'
#
# Install a PostgreSQL server instance
#
# @example
#   include role::postgresql_server
# 
class role::postgresql_server (
  $version = 12,
){

  #https://noobient.com/2019/11/26/postgresql-on-centos-8-and-rhel-8/
  #exec { 'dnf -y module disable postgresql':
  #  path        => ['/usr/bin'],
  #}
  package { 'postgresql':
    ensure   => 'disabled',
    provider => 'dnfmodule'
  }

  class { 'postgresql::globals':
    manage_package_repo => true,
    version             => String($version),
    require             => Package['postgresql'],
  }
  class { 'postgresql::server':
    require => Class['postgresql::globals'],
  }
}
