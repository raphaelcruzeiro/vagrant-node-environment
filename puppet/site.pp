
class apt_update {
    exec { "aptitudeUpdate":
        command => "sudo aptitude update",
        path => ["/bin", "/usr/bin"]
    }
}

node default {

  include nodejs
  include mongodb
  include apt_update

  include '::mongodb::server'

  package { 'git':
    ensure => 'installed',
    require => Exec["aptitudeUpdate"],
  }

  package { 'yo':
    provider => npm,
  }

  package { "generator-angular-fullstack":
      provider  => npm,
  }

  package { 'compass':
    ensure   => 'installed',
    provider => 'gem',
  }

  file { "/etc/profile.d/node_path.sh":
    content => "PATH=\$PATH:/usr/local/node/node-v0.10.24/bin\n",
  }
}
