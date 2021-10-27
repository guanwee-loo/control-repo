# @summary Install 7zip using Chocolatey as provider
#
# Install the latest 7Zip using the silent option '/qn' and reboot the server post installation
#
# @example
#   include profile::installer::sevenzip
class profile::installer::sevenzip {

  package { '7zip':
    ensure          => installed,
    provider        => 'chocolatey',
    install_options => ['-installArgs','"','/qn'],
    notify          => Reboot['after'],
  }
  reboot { 'after' :
    apply => finished,
  }

}
