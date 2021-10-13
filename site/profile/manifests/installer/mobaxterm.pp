# @summary A short summary of the purpose of this class
#
# An example to using regular Puppet resources to download and install MobaXTerm
# Using this method requires one to know exact URL of the zip file which consists of a random string of numbers
#
# @example
#   include profile::installer::mobaxterm
class profile::installer::mobaxterm (String $package_path = '2142021091974654/MobaXterm_Installer_v21.4.zip') {
  $extract_folder = "${profile::baseline::windows::admin_user::script_location}/${split($package_path,'/')[0]}"
  archive { "${profile::baseline::windows::admin_user::script_location}/${package_path}":
    ensure       => present,
    source       => "https://download.mobatek.net//${$package_path}",
    extract      => true,
    extract_path => $extract_folder,
  }
}
