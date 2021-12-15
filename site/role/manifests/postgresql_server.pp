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
    version             => String($version),
  }
  class { 'postgresql::server': }
}
