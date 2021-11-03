# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   profile::managed_user { 'namevar': }
define profile::managed_user (
  $password,
) {
  user { $title:
    ensure     => present,
    password   => $password,
    managehome => true,
  }

}
