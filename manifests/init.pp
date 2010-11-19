#
# apache module
#
# Copyright 2010, Atizo AG
# Simon Josi simon.josi+puppet(at)atizo.com
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#

class apache {
  package{'httpd':
    alias => 'apache',
    ensure => present,
  }
  service{'apache':
    name => 'httpd',
    ensure => running,
    enable => true,
  }
  file{[ '/etc/httpd/vhosts.d', '/var/www/vhosts' ]:
    ensure => directory,
    require => Package['httpd'],
    owner => root, group => 0, mode => 0755;
  }
  file{'/etc/sysconfig/httpd':
    source => [
      "puppet://$server/modules/site-apache/sysconfig/$fqdn/httpd",
      "puppet://$server/modules/site-apache/sysconfig/httpd",
      "puppet://$server/modules/apache/sysconfig/httpd",
    ],
    require => Package['httpd'],
    notify => Service['httpd'],
    owner => root, group => 0, mode => 0644;
  }
  apache::confd{[
    'defaults.inc',
    'vhosts.conf',
    'welcome.conf',
  ]:}
  apache::vhost::file{'0-default.conf':}
}
