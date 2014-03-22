# == Class erlang::install
#
class erlang::install {
  package { $erlang::packages:
    ensure => present,
  }

  Exec {
    path    => ['/bin','/sbin','/usr/bin','/usr/sbin'],
  }

  exec {
    "curl ${erlang::version}":
      command => "curl -s http://www.erlang.org/download/otp_src_${erlang::version}.tar.gz",
      cwd     => '/usr/src',
      creates => "/usr/src/otp_src_${erlang::version}.tar.gz",
      require => Package[$erlang::packages];
    "extract ${erlang::version}":
      command => "tar xzf otp_src_${erlang::version}.tar.gz",
      cwd     => '/usr/src',
      creates => "/usr/src/otp_src_${erlang::version}",
      require => Exec["curl ${erlang::version}"];
    "install ${erlang::version}":
      command => './configure --prefix=/usr/bin && make && make install',
      cwd     => "/usr/src/${erlang::version}",
      creates => '/usr/bin/erl',
      timeout => 0,
      require => Exec["extract ${erlang::version}"];
  }
}
