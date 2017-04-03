# == Class gosu::install
#
# This class is called from gosu for install.
#
class gosu::install(
  $gosu_version = $gosu::gosu_version,
) {
  include wget

  wget::fetch { "download_gosu":
    source      => "https://github.com/tianon/gosu/releases/download/${gosu_version}/gosu-${::architecture}",
    destination => '/usr/local/bin/gosu',
    timeout     => 0,
    verbose     => false,
    mode        => ['a+x', '755'],
  }

  file { '/usr/local/bin/gosu':
    mode => 'a+x',
  }

  exec { '/usr/local/bin/gosu nobody true':
    require => File['/usr/local/bin/gosu'],
  }
}
