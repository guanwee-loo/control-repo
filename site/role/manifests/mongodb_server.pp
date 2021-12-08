# @summary Setup a vanilla mongodb server
#
# Install a default mongodb instance along with the client and db tools
#
# @example
#   include role::mongodb_server
class role::mongodb_server (
  $version,
){
  class {'mongodb::globals':
    manage_package_repo => true,
    version             => $version,
  }
  -> class {'mongodb::server': }
  -> class {'mongodb::client': }

  package { "mongodb-org-tools-${version}":
    ensure  => installed,
    require => Class['mongodb::globals'],
  }
}
