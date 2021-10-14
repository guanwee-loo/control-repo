# @summary Install 7zip using Chocolatey as provider
#
# Install the latest 7Zip using the silent option '/qn'
#
# @example
#   include profile::installer::sevenzip
class profile::installer::sevenzip {

  include chocolatey

  package { '7zip':
    ensure          => latest,
    provider        => 'chocolatey',
    install_options => ['-installArgs','/qn'],
  }

}
