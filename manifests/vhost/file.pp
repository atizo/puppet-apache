define apache::vhost::file(
  $content = false,
  $ensure = present
) {
  include apache
  if $name !~ /\.conf$/ {
    $suffix = '.conf'
  } else {
    $suffix = ''
  }
  file{"/etc/httpd/vhosts.d/$name$suffix":
    ensure => $ensure,
    require => Package['httpd'],
    notify => Service['httpd'],
    owner => root, group => 0, mode => 0644;
  }
  if $content {
    File["/etc/httpd/vhosts.d/$name$suffix"]{
      content => $content,
    }
  } else {
    File["/etc/httpd/vhosts.d/$name$suffix"]{
      source => [
        "puppet://$server/modules/site-apache/vhosts.d/$fqdn/$name$suffix",
        "puppet://$server/modules/site-apache/vhosts.d/$name$suffix",
        "puppet://$server/modules/apache/vhosts.d/$name$suffix",
      ],
    }
  }
}
