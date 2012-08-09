class phpunit {
  # phpunit
  exec {"pear-channel-phpunit":
    command => "pear channel-discover pear.phpunit.de",
    require => Package["php-pear"],
    returns => [0,1]
  }
  exec {"pear-channel-ezno":
    command => "pear channel-discover components.ez.no",
    require => Package["php-pear"],
    returns => [0,1]
  }
  exec {"pear-channel-symphony":
    command => "pear channel-discover pear.symfony-project.com",
    require => Package["php-pear"],
    returns => [0,1]
  }
  exec {"pear-update-channels": 
    command => "pear update-channels",
    require => [ Exec["pear-channel-phpunit"],
                Exec["pear-channel-ezno"],
                Exec["pear-channel-symphony"],
                Package["php-pear"],
               ]
  }
  exec {"pear-upgrade": 
    command => "pear upgrade",
    require => [ Exec["pear-channel-phpunit"],
                Exec["pear-channel-ezno"],
                Exec["pear-channel-symphony"],
                Exec["pear-update-channels"],
                Package["php-pear"],
               ]
  }
  exec {"pear-install-phpunit": 
    command => "pear install --alldeps phpunit/PHPUnit",
    require => [ Exec["pear-channel-phpunit"],
                Exec["pear-channel-ezno"],
                Exec["pear-channel-symphony"],
                Exec["pear-update-channels"],
                Exec["pear-upgrade"],
                Package["php-pear"],
               ]
  }
  exec {"pear-install-dbunit":
    command => "pear install --alldeps phpunit/dbunit",
    require => [ Exec["pear-install-phpunit"],
                Package["php-pear"],
                ]
  }
}