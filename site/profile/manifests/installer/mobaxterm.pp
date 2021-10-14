# @summary A short summary of the purpose of this class
#
# An example to using regular Puppet resources to download and install MobaXTerm using the silent option '/qn'
# Using this method requires one to know the exact URL of the zip file to be downloaded. 
# The path consists of a random string of numbers and the zip file name and extract msi file names are not the same. 
#  --> This means they need to be hardcoded.
#
# @example
#   include profile::installer::mobaxterm
class profile::installer::mobaxterm (
    String $src = 'https://download.mobatek.net/2142021091974654',
    String $zip_file_name = 'MobaXterm_Installer_v21.4.zip',
    String $msi_file_name = 'MobaXterm_installer_21.4.msi',
  )
{
  $source = "${src}/${$zip_file_name}"
  $extract_folder = $profile::baseline::windows::admin_user::script_location
  $archive_file = "${extract_folder}/${zip_file_name}"
  $msi_file = "${extract_folder}/${msi_file_name}"

  archive { $archive_file:
    ensure       => present,
    source       => $source,
    extract      => true,
    extract_path => $extract_folder,
  }

  package { 'MobaXterm-21.4':
    ensure          => installed,
    source          => $msi_file,
    install_options => ['/qn'],
    subscribe       => Archive[$archive_file],
  }

}
