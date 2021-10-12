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
    ensure  => 'present',
    comment => 'Vandelay Admininstrative User',
    groups  => ['Vandelay Industries Administrators','Administrators'],
  }

  dsc_userrightsassignment {'Log on as a Service':
    dsc_ensure   => 'present',
    dsc_identity => ['Art Vandelay'],
    does         => ['SeServiceLogonRight'],
  }
}
