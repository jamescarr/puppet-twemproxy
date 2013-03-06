#
define twemproxy::pool {
  file { '/etc/nutcracker/nutcracker.yml':
      ensure   => 'present',
      owner    => 'root',
      group    => 'root',
      mode     => '0444',
  }
}
