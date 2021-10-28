# @summary Configure OS level baselines
#
# Configure OS requisite OS users/groups and security baselines
#
# @example
#   include profile::server_baseline
class profile::server_baseline {

  case $facts['kernel'] {
    'windows': {
      include profile::baseline::windows::admin_user
      include profile::baseline::windows::qol_settings
    }
    default: {
      #fail('Unsupported for now')
    }
  }

}
