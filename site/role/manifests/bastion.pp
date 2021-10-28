# @summary A bastion server role
#
# This class is used to configure the baselines for a server
# Also install a webserver if its certifcate extensions contains the webserver pp_role
#
# @example
#   include role::bastion
class role::bastion {

  #class{ 'profile::base':
  #  message => lookup('message')
  #}
  include profile::base

}
