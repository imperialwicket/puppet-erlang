# == Type: erlang::common_package
#
# Check if a package is defined before attempting to install.
#
# Avoids common issues with gcc/make/build-essentials packages being defined
# in multiple modules.
#
#
# === Parameters
#
# package - the package
#
# === Actions:
#
# === Requires:
#
# === Sample Usage:
#
# erlang::common_package{ 'gcc': }
#   or
# $packages = ['gcc','make']
# erlang::common_package { $packages: }
#
define erlang::common_package ( $package = $title ){
  if ! defined(Package[$package]) {
    package { $package:
      ensure => installed,
    }
  }
}
