# Class: webmin::monitor::absent
#
# Remove webmin monitor elements
#
class webmin::monitor::absent {

    include webmin::params

    # Port monitoring
    monitor::port { "webmin_${webmin::params::protocol}_${webmin::params::port}": 
        protocol => "${webmin::params::protocol}",
        port     => "${webmin::params::port}",
        target   => "${webmin::params::monitor_target_real}",
        enable   => "false",
        tool     => "${monitor_tool}",
    }
    
    # URL monitoring 
    monitor::url { "webmin_url":
        url      => "${webmin::params::monitor_baseurl_real}/index.php",
        pattern  => "${webmin::params::monitor_url_pattern}",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

    # Process monitoring 
    monitor::process { "webmin_process":
        process  => "${webmin::params::processname}",
        service  => "${webmin::params::servicename}",
        pidfile  => "${webmin::params::pidfile}",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

    # Use a specific plugin (according to the monitor tool used)
    monitor::plugin { "webmin_plugin":
        plugin   => "webmin",
        enable   => "false",
        tool     => "${monitor_tool}",
    }

}
