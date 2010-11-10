define apache::vhost::template(
  $template,
  $context = {},
  $ensure = present
) {
  include apache
  file{"/etc/httpd/vhosts.d/$name.conf":
    ensure => $ensure,
    content => template("site-apache/$template.erb"),
    require => Package['httpd'],
    notify => Service['httpd'],
    owner => root, group => 0, mode => 0644;
  }
}
