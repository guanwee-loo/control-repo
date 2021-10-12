# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::baseline::windows::admin_user
class profile::baseline::windows::admin_user {

  group { 'Vandelay Industries Administrators':
    ensure => 'present',
  }
  user { 'Art Vandelay':
    ensure => 'present',
    groups => ['Vandelay Industries Administrators','Administrators'],
  }
}
