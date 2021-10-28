# @summary A base class to contain all baseline profiles
#
# Collect all the server (OS level) and installable software baselines
#
# @example
#   include profile::base
class profile::base (
  $message = lookup('message')
) {

  notify { 'profile message':
    message => $message,
  }
  include profile::server_baseline
  include profile::install_baseline

}
