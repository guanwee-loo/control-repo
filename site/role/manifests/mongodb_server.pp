# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include role::mongodb_server
class role::mongodb_server {
  class {'mongodb::server':
    create_admin   => true,
    admin_username => 'admin',
  }
}
