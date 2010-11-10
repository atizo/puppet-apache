define apache::vhost::generator(
  $ensure = present,
  $http = false,
  $https = false
) {
  include apache
  if $http {
    $http_tree = vhost_generator($http)
  }
  if $https {
    $https_tree = vhost_generator($https)
  }
  file{"/etc/httpd/vhosts.d/$name":
    ensure => $ensure,
    content => template("apache/vhosts/generator.erb"),
    require => Package['httpd'],
    notify => Service['httpd'],
    owner => root, group => 0, mode => 0644;
  }
}
