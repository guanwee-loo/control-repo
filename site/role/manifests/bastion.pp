# @summary A bastion server role
#
# This class is used to configure the baselines for a server
# Also install a webserver if its certifcate extensions contains the webserver pp_role
#
# @example
#   include role::bastion
class role::bastion {

  #class{ 'profile::base':
  #  message => profile::message
  #}
  include profile::base

  if $trusted['extensions']['pp_role'] == 'webserver' {
    include profile::webserver
  }
  notify { 'role message':
    message => lookup('profile::base::message'),
  }
}
