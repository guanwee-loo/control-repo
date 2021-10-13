# @summary A short summary of the purpose of this class
#
# An example to download and install MobaXTerm
#
# @example
#   include profile::installer::mobaxterm
class profile::installer::mobaxterm (String $software = 'MobaXterm_Installer_v21.4.zip') {
  archive { "${profile::baseline::windows::admin_user::script_location}/${software}":
    ensure       => present,
    source       => "https://download.mobatek.net/2142021091974654/${software}",
    extract_path => $profile::baseline::windows::admin_user::script_location,
  }
}
