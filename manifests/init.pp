# Class: gosu
# ===========================
#
# Full description of class gosu here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class gosu (
  $gosu_version = $::gosu::params::gosu_version,
) inherits ::gosu::params {

  # validate parameters here

  class { '::gosu::install': } ->
  Class['::gosu']
}
