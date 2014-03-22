# == Class: erlang
#
# Install Erlang from source.
#
# === Parameters
#
# [*packages*]
#   Packages required to build erlang for this os. Override for a leaner installation.
# [*version*]
#   Erlang version to install.
#
class erlang (
  $packages = $erlang::params::packages,
  $version = $erlang::params::version
) inherits erlang::params {

  # validate parameters here

  class { 'erlang::install': } ->
  Class['erlang']
}
