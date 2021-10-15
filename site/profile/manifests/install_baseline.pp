# @summary Install requsite software
#
# A description of what this class does
#
# @example
#   include profile::install_baseline
class profile::install_baseline {

  case $facts['kernel'] {
    'windows': {
      include profile::installer::mobaxterm
      include profile::installer::chocolatey
      include profile::installer::sevenzip
    }
    default: {
      notify { 'WIP':
        message => 'To be added'
      }
    }
  }

}
