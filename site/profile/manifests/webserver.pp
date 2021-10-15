# @summary Install a webserver
#
# Install an IIS web server for windows
#
# @example
#   include profile::webserver
class profile::webserver {

  case $facts['kernel'] {
    'windows': {
      include profile::server::windows::iis
    }
    default: {
      fail('Unsupported for now')
    }
  }

}
