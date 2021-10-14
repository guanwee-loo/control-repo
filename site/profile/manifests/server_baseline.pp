# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::server_baseline
class profile::server_baseline {
# OS-specific
  case $facts['kernel'] {
    'windows': {
      include profile::baseline::windows::admin_user
      include profile::baseline::windows::qol_settings
      include profile::installer::mobaxterm
      include profile::installer::chocolatey
    }
    default: {
      fail('Unsupported operating system!')
    }
  }
}
