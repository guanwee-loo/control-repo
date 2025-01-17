# @summary A base class to contain all baseline profiles
#
# Collect all the server (OS level) and installable software baselines
#
# @example
#   include profile::base
class profile::base {

  include profile::server_baseline
  include profile::install_baseline

}
