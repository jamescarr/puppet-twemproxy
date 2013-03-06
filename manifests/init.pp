# == Class: twemproxy
#
# Full description of class twemproxy here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. 'Specify one or more upstream ntp servers as an array.'
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if it
#   has a default. e.g. 'The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames.' (Note,
#   global variables should not be used in preference to class parameters  as of
#   Puppet 2.6.)
#
# === Examples
#
#  class { twemproxy:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ]
#  }
#
# === Authors
#
# James R. Carr <james.r.carr@gmail.com>
#
# === Copyright
#
# Copyright 2013 Your name here, unless otherwise noted.
#
class twemproxy(
  $hostaddress='127.0.0.1',
  $port='22121',
  $hash='fnv1a_64',
  $servers=[]
) {
  $bind_address = "${hostaddress}:${port}"

  file { 'twemproxy-package':
    ensure => 'present',
    path   => '/tmp/nutcracker_0.2.3-1_amd64.deb',
    source => 'puppet:///modules/twemproxy/nutcracker_0.2.3-1_amd64.deb'
  }
  package { 'puppet-dashboard':
    provider => 'dpkg',
    ensure   => latest,
    source   => '/tmp/nutcracker_0.2.3-1_amd64.deb'
    require  => File['twemproxy-package'],
  }

  file { '/etc/nutcracker':
    ensure => directory,
  }
  file { '/etc/nutcracker/nutcracker.yml':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
    require => File['/etc/nutcracker'],
  }
}
