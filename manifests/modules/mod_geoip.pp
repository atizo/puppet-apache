class apache::modules::mod_geoip {
  package{'mod_geoip':
    ensure => installed,
    notify => Service['httpd'],
  }
}
