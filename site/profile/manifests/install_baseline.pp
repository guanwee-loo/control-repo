# @summary Install requsite software
#
# Install required productivity software in the server
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
      #fail('Unsupported for now')
    }
  }

}
