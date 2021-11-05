# @summary Install 7zip using Chocolatey as provider
#
# Install the latest 7Zip and reboot the server post installation
# The 7Zip installer will wait for a confirmation prompt before installing
# and hence we need to enable the Chocolatey "allowglobalconfirmation"
# @example
#   include profile::installer::sevenzip
class profile::installer::sevenzip (
  Boolean $class_noop   = false, #default to enforcement
) {

  #noop($class_noop)
  chocolateyfeature { 'allowglobalconfirmation':
    ensure  => 'enabled',
  }
  package { '7zip':
    ensure   => installed,
    provider => 'chocolatey',
    notify   => Reboot['after'],
  }
  reboot { 'after' :
    apply => finished,
  }

  #noop(undef)
}
