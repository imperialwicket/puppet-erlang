# == Class erlang::params
#
# This class is meant to be called from erlang
# It sets variables according to platform
#
class erlang::params {
  $version = 'R16B03-1'

  case $::osfamily {
    'Debian','Ubuntu': {
      $packages = [
        'build-essential',
        'm4',
        'libncurses5-dev',
        'libssh-dev',
        'unixodbc-dev',
        'libgmp3-dev',
        'libwxgtk2.8-dev',
        'libglu1-mesa-dev',
        'fop',
        'xsltproc',
        'default-jdk']
    }
    'RedHat', 'Amazon': {
      $packages = [
        'gcc',
        'gcc-c++',
        'make',
        'libxslt',
        'fop',
        'ncurses-devel',
        'openssl-devel',
        'openjdk-devel',
        'unixODBC',
        'unixODBC-devel']
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
