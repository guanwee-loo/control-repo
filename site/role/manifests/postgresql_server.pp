# @summary Setup a vanilla postgresql server 
#
# Install a PostgreSQL server instance
#
# @example
#   include role::postgresql_server
class role::postgresql_server (
  $version,
){
  class { 'postgresql::globals':
    manage_package_repo => true,
    String[1] version   => $version,
  }
  class { 'postgresql::server': }
}
