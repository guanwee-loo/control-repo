# @summary A short summary of the purpose of this class
#
# Create an admin user and a script folder 
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
    before  => File['C:/adminTools'],
  }

  # Use a 3rd party DSC from the forge for now as I am unable to determine whether the User resource can archieve this
  dsc_userrightsassignment {'Log on as a Service':
    dsc_ensure    => 'Present',
    dsc_identity  => ['Art Vandelay'],
    dsc_privilege => 'SeServiceLogonRight',
    before        => User['.\Art Vandelay'],
  }

  file {'C:/adminTools':
    ensure => directory,
  }

  acl {'C:/adminTools':
    permissions                => [
      { identity => 'Art Vandelay', rights => ['full']},
      { identity => 'Vandelay Industries Administrators', rights => ['read','execute']}
    ],
    inherit_parent_permissions => 'false',
    require                    => File['C:/adminTools'],
  }

}
