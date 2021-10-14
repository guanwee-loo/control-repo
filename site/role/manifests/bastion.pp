# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include role::bastion
class role::bastion {
  include profile::base
  if $trusted['extensions']['pp_role'] == 'webserver' {
    include profile::webserver
  }
}
