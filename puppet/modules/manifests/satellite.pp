# Class: icinga2::satellite
#
# This class installs icinga2 satellite
#
# Parameters:
#
# Actions:
#   - Install icinga2 satellite
#   - Manage icinga2 satellite service
#
# Requires:
#
# Sample Usage:
#
class icinga2::satellite {
  include icinga2

  package {
    ['nagios-nrpe-plugin','nagios-plugins-jmx']:
      ensure => installed;
  }

  file {
    '/etc/icinga2/zones.conf':
      owner    => 'root',
      group    => 'root',
      mode     => '0644',
      content  => template("${::puppet_dir_master}/systems/_LINUX_/etc/icinga2/zones.conf"),
      notify   => Service['icinga2-reload'],
      require  => Package['icinga2'];
  }
}
