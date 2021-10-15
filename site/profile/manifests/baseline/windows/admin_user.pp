# @summary Setup an administrative user/group and script folder
#
# Create an privileged user and group 
# Create an admin script folder with ACL
#
# @example
#   include profile::baseline::windows::admin_user
class profile::baseline::windows::admin_user {

  $admin_user      = 'Art Vandelay'
  $admin_group     = 'Vandelay Industries Administrators'
  $script_location = 'C:/adminTools'

  group { $admin_group:
    ensure => 'present',
  }

  user { $admin_user:
    ensure   => 'present',
    password => lookup('password'),
    comment  => 'Vandelay Admininstrative User',
    groups   => [$admin_group,'Administrators'],
    before   => File[$script_location],
  }

  # Use a 3rd party DSC from the forge for now as I am unable to determine whether the User resource can archieve this
  # Specify the hostname before the user name to avoid re-applying the change in every in Puppet run 
  dsc_userrightsassignment {'Log on as a Service':
    require       => User[$admin_user],
    dsc_ensure    => 'Present',
    dsc_identity  => ["${facts['hostname']}\\${admin_user}"],
    dsc_privilege => 'SeServiceLogonRight',
  }

  file {$script_location:
    ensure  => directory,
  }

  acl {$script_location:
    require                    => File[$script_location],
    permissions                => [
      { identity => $admin_user, rights  => ['full']},
      { identity => $admin_group, rights => ['read','execute']}
    ],
    inherit_parent_permissions => 'false',
  }

}
