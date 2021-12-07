# @summary A short summary of the purpose of this class
#
# A description of what this class does
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
