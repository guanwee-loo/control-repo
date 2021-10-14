# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::base
class profile::base {
  include profile::server_baseline
  include profile::installer::mobaxterm
  include profile::installer::chocolatey
  include profile::installer::sevenzip
}
