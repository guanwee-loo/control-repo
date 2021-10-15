# @summary A bastion server role
#
# This class is used to configure the baselines for an OS as well as a webserver
#
# @example
#   include role::bastion
class role::bastion {

  include profile::base

  if $trusted['extensions']['pp_role'] == 'webserver' {
    include profile::webserver
  }

}
