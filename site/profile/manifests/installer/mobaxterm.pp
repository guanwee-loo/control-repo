# @summary Install MobaXterm Community Edition
#
# An example to using regular Puppet resources to download and install MobaXTerm using the silent option '/qn'
# Using this method requires one to know the exact URL of the zip file to be downloaded 
# and the name of the package used in the Windows registry.
# The path consists of a random string of numbers and the zip file name and extract msi file names are not the same. 
#  --> This means they need to be hardcoded in the hiera
#
# @example
#   include profile::installer::mobaxterm
class profile::installer::mobaxterm (

    String $src =  lookup('profile::installer::mobaxterm::src'),
    String $zip_file_name = lookup('profile::installer::mobaxterm::zip_file_name'),
    String $msi_file_name = lookup('profile::installer::mobaxterm::msi_file_name'),
) {

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

  package { 'MobaXterm':
    ensure          => installed,
    source          => $msi_file,
    install_options => ['/qn'],
    subscribe       => Archive[$archive_file],
  }

}
