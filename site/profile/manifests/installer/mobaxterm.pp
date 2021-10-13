# @summary A short summary of the purpose of this class
#
# An example to download and install MobaXTerm
#
# @example
#   include profile::installer::mobaxterm
class profile::installer::mobaxterm (String $package_path = '2142021091974654/MobaXterm_Installer_v21.4.zip') {
  archive { "${profile::baseline::windows::admin_user::script_location}/${package_path}":
    ensure       => present,
    source       => "https://download.mobatek.net//${$package_path}",
    extract_path => $profile::baseline::windows::admin_user::script_location,
  }
}
