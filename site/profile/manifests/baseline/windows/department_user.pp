# @summary Provision department users 
#
# Setup the department users with a shared password used in the department
# @example
#   include profile::baseline::windows::department_user
class profile::baseline::windows::department_user {
    profile::managed_user { lookup('profile::baseline::windows::department_user::users'):
      password => lookup('profile::baseline::windows::department_user::password')
    }
}
