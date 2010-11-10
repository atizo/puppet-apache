class apache::ssl {
  package{'mod_ssl':
    ensure => present,
    require => Package['httpd'],
  }
  apache::confd{ ['ssl.conf', 'ssl_defaults.inc' ]: }
  apache::vhost::file{'0-default_ssl.conf': }
}
