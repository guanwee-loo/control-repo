# @summary Configure Quality of Life settings
#
# (1) Disable IEESC 
# (based on https://docs.microsoft.com/en-us/troubleshoot/browsers/enhanced-security-configuration-faq#how-to-turn-off-internet-explorer-esc-on-windows-servers)
#
# (2) Enable Windows Shutdown Event Tracker 
#
# @example
#   include profile::baseline::windows::qol_settings
class profile::baseline::windows::qol_settings {

    registry_value { 'HKLM\Software\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled':
      ensure => present,
      type   => dword,
      data   => 0,
    }
    registry_value { 'HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}\IsInstalled':
      ensure => present,
      type   => dword,
      data   => 0,
    }
    registry_value { 'HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\IEHarden':
      ensure => present,
      type   => dword,
      data   => 0,
    }
    registry_value { 'HKLM\Software\Microsoft\Internet Explorer\Main\First Home Page':
      ensure => absent,
    }
    registry_value { 'HKLM\Software\Microsoft\Internet Explorer\Main\Default_Page_URL':
      ensure => present,
      type   => string,
      data   => 'about:blank',
    }
    registry_value { 'HKLM\Software\Microsoft\Internet Explorer\Main\Start Page':
      ensure => present,
      type   => string,
      data   => 'about:blank',
    }
    # Following to enable Shutdown Event UI
    $shutdown_reg_parent_key = 'HKLM\Software\Policies\Microsoft\Windows NT\Reliability'
    registry_key { $shutdown_reg_parent_key:
      ensure => present,
    }
    registry_value { "${shutdown_reg_parent_key}\\ShutdownReasonOn" :
      ensure  => present,
      type    => dword,
      data    => 1,
      require => Registry_key[$shutdown_reg_parent_key],
    }
    registry_value { "${shutdown_reg_parent_key}\\ShutdownReasonUI" :
      ensure  => present,
      type    => dword,
      data    => 1,
      require => Registry_key[$shutdown_reg_parent_key],
    }
}
