## site.pp ##

# This file (./manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
# https://puppet.com/docs/puppet/latest/dirs_manifest.html
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition if you want to use it.

## Active Configurations ##

# Disable filebucket by default for all File resources:
# https://github.com/puppetlabs/docs-archive/blob/master/pe/2015.3/release_notes.markdown#filebucket-resource-no-longer-created-by-default
File { backup => false }

## Node Definitions ##

# The default node definition matches any node lacking a more specific node
# definition. If there are no other node definitions in this file, classes
# and resources declared in the default node definition will be included in
# every node's catalog.
#
# Note that node definitions in this file are merged with node data from the
# Puppet Enterprise console and External Node Classifiers (ENC's).
#
# For more on node definitions, see: https://puppet.com/docs/puppet/latest/lang_node_definitions.html

$variable = 'top scope'
# Resource default in site.pp
Notify {
  message => "Resource default set in ${variable}",
}

class basics4 {
  $variable = 'class scope'
  #Notify {
  #  message => "Resource default set in ${variable}"
  #}
  notify { "Message set in ${variable}":
  }
}
class basics4_child inherits basics4 {
  $variable = 'child scope'
  notify { "Message set in ${variable}":
  }
  #debug ($variable)
}

node default {
  $variable = 'node scope'
  # This is where you can declare classes for all nodes.ß
  include basics4
  Notify {
    message => "Resource default set in ${basics4::variable}"
  }
  class { 'basics4_child': }
}
