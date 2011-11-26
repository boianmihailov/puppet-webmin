# Class: webmin::firewall
#
# Manages webmin firewalling using custom Firewall wrapper
# By default it opens webmin's default port(s) to anybody
# It's automatically included if $firewall=yes
#
# Usage:
# Automatically included if $firewall=yes 
#
class webmin::firewall {

    include webmin::params

    firewall { "webmin_${webmin::params::protocol}_${webmin::params::port}":
        source      => "${webmin::params::firewall_source_real}",
        destination => "${webmin::params::firewall_destination_real}",
        protocol    => "${webmin::params::protocol}",
        port        => "${webmin::params::port}",
        action      => "allow",
        direction   => "input",
        enable      => "${webmin::params::firewall_enable}",
    }

}
