class apache::modules::mod_wsgi {
  package{'mod_wsgi':
    ensure => installed,
    notify => Service['httpd'],
  }
  apache::confd{'wsgi.conf': }
}
