# @summary Install 7zip using Chocolatey as provider
#
# Install the latest 7Zip and reboot the server post installation
# The 7Zip installer will wait for a confirmation prompt before installing
# and hence we need to enable the Chocolatey "allowglobalconfirmation"
# Set the parameter "reboot_allowed" to indicate whether reboot is allowed.
#  This is useful when the server is not in "build" phase so Puppet reboot is forbidden.
# @example
#   include profile::installer::sevenzip
class profile::installer::sevenzip (
    Boolean $reboot_allowed   = lookup('reboot_allowed')
) {

  chocolateyfeature { 'allowglobalconfirmation':
    ensure  => 'enabled',
  }
  package { '7zip':
    ensure   => installed,
    name     => '7zip',
    provider => 'chocolatey',
    notify   => Reboot['after'],
  }

  $noop = !$reboot_allowed
  noop($noop)

  reboot { 'after' :
    apply => finished,
  }

  noop(undef)
}
