# Class: webmin::disable
#
# Stops webmin service and disables it at boot time
# Removes the monitor checks, but not the other extended elements (backup, firewall)
# Use webmin::absent to remove everything
#
# Usage:
# include webmin::disable
#
class webmin::disable {

    require webmin::params

    package { "webmin":
        name   => "${webmin::params::packagename}",
        ensure => present,
    }

    service { "webmin":
        name       => "${webmin::params::servicename}",
        ensure     => "stopped" ,
        enable     => "false",
        require    => Package["webmin"],
    }

    # Remove relevant monitor, backup, firewall entries
    if $monitor == "yes" { include webmin::monitor::absent }
    # if $backup == "yes" { include webmin::backup::absent }
    # if $firewall == "yes" { include webmin::firewall::absent  }

    # Include debug class is debugging is enabled ($debug=yes)
    if ( $debug == "yes" ) or ( $debug == true ) { include webmin::debug }

}
