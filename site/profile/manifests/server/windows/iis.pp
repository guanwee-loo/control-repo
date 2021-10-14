# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include profile::server::windows::iis
class profile::server::windows::iis {
    $web_root='c:/inetpub/wwwroot'
    $iis_features = ['Web-WebServer']
    iis_feature { $iis_features:
      ensure => 'present',
    }
    iis_site {'basics3':
      ensure       => 'started',
      physicalpath => $web_root,
      require      => File['indexhtml'],
    }

    file {"${web_root}/index.html":
      ensure => 'present',
      source => 'puppet:///modules/profile/index.html'
    }

}
