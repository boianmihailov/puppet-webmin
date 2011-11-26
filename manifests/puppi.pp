# Class: webmin::puppi
#
# This class manages the puppi extensions for the webmin module
# It's automatically included and used if $puppi=yes
#
class webmin::puppi {
    
    puppi::info::module { "webmin":
        packagename => "${webmin::params::packagename}",
        servicename => "${webmin::params::servicename}",
        processname => "${webmin::params::processname}",
        configfile  => "${webmin::params::configfile}",
        configdir   => "${webmin::params::configdir}",
        pidfile     => "${webmin::params::pidfile}",
        datadir     => "${webmin::params::datadir}",
        logdir      => "${webmin::params::logdir}",
        protocol    => "${webmin::params::protocol}",
        port        => "${webmin::params::port}",
        description => "What Puppet knows about webmin" ,
        # run         => "webmin -V###",
    }

    puppi::log { "webmin":
        description => "Logs of webmin" ,  
        log      => "${webmin::params::logdir}",
    }

}
