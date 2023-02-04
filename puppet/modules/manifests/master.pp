# Class: icinga2::master
#
# This class installs an icinga2 master node
#
# Parameters:
#
# Actions:
#   - Install icinga2 master node
#
# Requires:
#
# Sample Usage:
#
class icinga2::master {
  include icinga2

  nginx::vhost { 'icinga.ignitionone.com':
    config   => 'icinga.ignitionone.com',
    logdir   => 'icinga.ignitionone.com',
    priority => '075';
  }

  package {
    'icingaweb2':
      ensure => installed;
  }

  file {
    '/etc/icinga2/zones.d':
      ensure  => directory,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      recurse => remote,
      notify  => Service['icinga2-reload'],
      source  => 'puppet:///puppet_dir_master/systems/_LINUX_/etc/icinga2/zones.d',
      require => Package['icinga2'];
  }
}
