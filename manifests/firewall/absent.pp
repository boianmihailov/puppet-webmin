# Class: webmin::firewall::absent
#
# Remove webmin firewall elements
#
class webmin::firewall::absent {

    include webmin::params

    firewall { "webmin_${webmin::params::protocol}_${webmin::params::port}":
        source      => "${webmin::params::firewall_source_real}",
        destination => "${webmin::params::firewall_destination_real}",
        protocol    => "${webmin::params::protocol}",
        port        => "${webmin::params::port}",
        action      => "allow",
        direction   => "input",
        enable      => "false",
    }

}
