class php {
  $php_packages = [
      "php5",
      "php5-mysql",
      "php5-mcrypt",
      "php5-curl",
      "php5-imap",
      "php5-xcache",
      "php5-gd",
      "php5-xdebug",
      "php-pear",
  ]
  
  Package {
      ensure  => installed,
      require => Bulkpackage["php-packages"],
  }
  
  bulkpackage { "php-packages":
      packages => $php_packages,
      require  => [ Exec["apt-get_update"],
                    Exec["apt-get_upgrade"]
                  ],
  }
  
  package { $php_packages: }
}

