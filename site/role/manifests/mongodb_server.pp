# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include role::mongodb_server
class role::mongodb_server (
  $admin_username,
  $admin_password,
  $version = '4.2.15',
){
  class {'mongodb::globals':
    manage_package_repo => true,
    version             => $version,
    before              => Class['mongodb::server'],
  }
  class {'mongodb::server':
    create_admin   => true,
    admin_username => $admin_username,
    admin_password => $admin_password,
  }
  class {'mongodb::client': }

  mongodb::db {'testdb':
    require  => Class['mongodb::server'],
    user     => 'user1',
    password => $admin_password,
  }
}
