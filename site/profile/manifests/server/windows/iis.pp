# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::server::windows::iis
class profile::server::windows::iis {

    $iis_features = ['Web-WebServer']
    iis_feature { $iis_features:
      ensure => 'present',
    }

}
