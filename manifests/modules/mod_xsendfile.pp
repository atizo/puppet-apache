class apache::modules::mod_xsendfile { 
  package{'mod_xsendfile':
    ensure => installed,
    notify => Service['httpd'],
  }
}
