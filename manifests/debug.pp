#
# Class: webmin::debug
#
# This class is used only for debugging purposes
#
# Usage:
# This class is autoloaded if you set $debug=yes
#
class webmin::debug {

    # Load the variables used in this module. Check the params.pp file 
    require webmin::params
    include puppet::debug
    include puppet::params

    file { "puppet_debug_variables_webmin":
        path    => "${puppet::params::debugdir}/variables/webmin",
        mode    => "${webmin::params::configfile_mode}",
        owner   => "${webmin::params::configfile_owner}",
        group   => "${webmin::params::configfile_group}",
        ensure  => present,
        require => File["puppet_debug_variables"],
        content => template("webmin/variables_webmin.erb"),
    }

}
