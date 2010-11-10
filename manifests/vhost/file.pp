define apache::vhost::file(
  $ensure = present
) {
  include apache
  file{"/etc/httpd/vhosts.d/$name":
    ensure => $ensure,
    source => [
      "puppet://$server/modules/site-apache/vhosts.d/$fqdn/$name",
      "puppet://$server/modules/site-apache/vhosts.d/$name",
      "puppet://$server/modules/apache/vhosts.d/$name",
    ],
    require => Package['httpd'],
    notify => Service['httpd'],
    owner => root, group => 0, mode => 0644;
  }
}
