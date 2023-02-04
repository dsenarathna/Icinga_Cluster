# Class: icinga2
#
# This class installs icinga2
#
# Parameters:
#
# Actions:
#   - Install icinga2
#   - Manage icinga2 service
#
# Requires:
#
# Sample Usage:
#
class icinga2 {
  package {
    'icinga2':
      ensure => installed;
  }

  service {
    'icinga2':
      ensure     => running,
      enable     => true,
      hasrestart => true,
      hasstatus  => true,
      require    => Package['icinga2'];
  }

  service {
    'icinga2-reload':
      pattern  => '/usr/lib/x86_64-linux-gnu/icinga2/sbin/icinga2',
      provider => 'base',
      restart  => '/etc/init.d/icinga2 reload',
      require  => Package['icinga2'];
  }
}
