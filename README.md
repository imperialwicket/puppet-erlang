####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with erlang](#setup)
    * [What erlang affects](#what-erlang-affects)
    * [Beginning with erlang](#beginning-with-erlang)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
6. [Limitations - OS compatibility, etc.](#limitations)
7. [Development - Guide for contributing to the module](#development)

##Overview

Install Erlang from source at the provided version, supports some members of the RHEL and Debian families.

##Module Description

Install Erlang from source at the provided version. Supports some members of the RHEL and Debian families. 

##Setup

###What erlang affects

* Provides /usr/bin/erl 

###Beginning with erlang

`include erlang` 

Installs Erlang at the default version including most of the optional packages for configuration.

##Usage

    class { 'erlang':
      version  => 'R15B02',
      packages => [
        'gcc',
        'gcc-c++',
        'make',
        'libxslt',
        'fop',
        'ncurses-devel',
        'openssl-devel',],
    }

Install Erlang at version R15B02, and avoid installing a JDK or the unixODBC packages.

##Reference

TODO

##Limitations

TODO

##Development

TODO
