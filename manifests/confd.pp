define apache::confd(
  $ensure = present
) {
  include apache
  file{"/etc/httpd/conf.d/$name":
    ensure => $ensure,
    source => [
      "puppet://$server/modules/site-apache/conf.d/$fqdn/$name",
      "puppet://$server/modules/site-apache/conf.d/$domain/$name",
      "puppet://$server/modules/site-apache/conf.d/$name",
      "puppet://$server/modules/apache/conf.d/$name",
    ],
    require => Package['httpd'],
    notify => Service['httpd'],
    owner => root, group => 0, mode => 0644;
  }
}
