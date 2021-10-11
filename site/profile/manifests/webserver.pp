# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::webserver
class profile::webserver {
  case $facts['kernel'] {
    'windows': {
      include profile::server::windows::iis
    }
    default: {
    fail('Unsupported operating system!')
    }
  }
}
