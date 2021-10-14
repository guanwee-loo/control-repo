# @summary A short summary of the purpose of this class
#
# An example to using regular Puppet resources to download and install MobaXTerm using the silent option '/qn'
# Using this method requires one to know the exact URL of the zip file to download from. 
# The path consists of a random string of numbers
#
# @example
#   include profile::installer::mobaxterm
class profile::installer::mobaxterm (String $package_path = '2142021091974654/MobaXterm_Installer_v21.4.zip') {
  $source = "https://download.mobatek.net/${$package_path}"
  $extract_folder = "${profile::baseline::windows::admin_user::script_location}/${split($package_path,'/')[0]}"
  $archive_file = "${profile::baseline::windows::admin_user::script_location}/${package_path}"
  $msi_file = "${regsubst($archive_file,'zip','msi')}"

  archive { $archive_file:
    ensure       => present,
    source       => $source,
    extract      => true,
    extract_path => $extract_folder,
  }

  notify { "Extracted file is ${msi_file}":
    withpath => true,
  }

  package { 'MobaXterm':
    ensure          => installed,
    source          => $msi_file,
    install_options => ['/qn'],
    subscribe       => Archive[$archive_file],
  }

}
