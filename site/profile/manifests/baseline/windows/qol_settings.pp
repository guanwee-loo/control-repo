# @summary A short summary of the purpose of this class
#
# Disable IEESC and enable Windows Shutdown Event Tracker 
#
# @example
#   include profile::baseline::windows::qol_settings
class profile::baseline::windows::qol_settings {
    registry_value { 'HKLM\Software\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled':
      ensure => present,
      type   => dword,
      data   => 0,
    }
    registry_value { 'HKLM\Software\Microsoft\Active Setup\Installed Components\{{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled':
      ensure => present,
      type   => dword,
      data   => 0,
    }

}
