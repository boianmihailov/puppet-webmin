# Class: webmin::backup::absent
#
# Remove webmin backup elements
#
class webmin::backup::absent {

    include webmin::params

    backup { "webmin_data": 
        frequency => "${webmin::params::backup_frequency}",
        path      => "${webmin::params::datadir}",
        enabled   => "false",
        target    => "${webmin::params::backup_target_real}",
    }
    
    backup { "webmin_logs": 
        frequency => "${webmin::params::backup_frequency}",
        path      => "${webmin::params::logdir}",
        enabled   => "false",
        target    => "${webmin::params::backup_target_real}",
    }

}
