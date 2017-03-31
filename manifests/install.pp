# == Class gosu::install
#
# This class is called from gosu for install.
#
class gosu::install(
  $gosu_version = $gosu::gosu_version,
) {
  include wget

  wget::fetch { "https://github.com/tianon/gosu/releases/download/${gosu_version}/gosu-${::architecture}":
    destination => '/usr/local/bin/gosu',
    timeout     => 0,
    verbose     => false,
    mode        => "+x"
  }
  -> exec { 'gosu nobody true'
    path => '/usr/local/bin',
  }
}
