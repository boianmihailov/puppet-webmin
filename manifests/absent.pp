# Class: webmin::absent
#
# Removes webmin package and its relevant monitor, backup, firewall entries
#
# Usage:
# include webmin::absent
#
class webmin::absent {

    require webmin::params

    package { "webmin":
        name   => "${webmin::params::packagename}",
        ensure => absent,
    }

    # Remove relevant monitor, backup, firewall entries
    if $monitor == "yes" { include webmin::monitor::absent }
    if $backup == "yes" { include webmin::backup::absent }
    if $firewall == "yes" { include webmin::firewall::absent  }

    # Include debug class is debugging is enabled ($debug=yes)
    if ( $debug == "yes" ) or ( $debug == true ) { include webmin::debug }

}
