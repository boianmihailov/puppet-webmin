# Class: webmin::backup
#
# Backups webmin data and logs using Example42 backup meta module (to be adapted to custom backup solutions)
# It's automatically included and used if $backup=yes
# This class permits to abstract what you want to backup from the tool and module to use for backups.
#
# Variables:
# The behaviour of this class has some defaults that can be overriden by user's variables:
# $webmin_backup_data (true|false) : Set if you want to backup webmin's data. Default: As defined in $backup_data
# $webmin_backup_log (true|false) : Set if you want to backup webmin's logs. Default: As defined in $backup_log
# $webmin_backup_frequency (hourly|daily|weekly|monthly) : Set the frequency of your webmin backups. Default: daily.
# $webmin_backup_target : Define how to reach (Ip, fqdn...) this host to backup webmin from an external server. Default: As defined in $backup_target
# 
# You can also set some site wide variables that can be overriden by the above module specific ones:
# $backup_data (true|false) : Set if you want to enable data backups site-wide. 
# $backup_log (true|false) : Set if you want to enable logs backups site-wide. 
# $backup_target : Set the ip/hostname you want to use on an external backup server to backup this host
# For the defaults of the above variables check webmin::params
#
# Usage:
# Automatically included if $backup=yes
#
class webmin::backup {

    include webmin::params

    backup { "webmin_data": 
        frequency => "${webmin::params::backup_frequency}",
        path      => "${webmin::params::datadir}",
        enabled   => "${webmin::params::backup_data_enable}",
        target    => "${webmin::params::backup_target_real}",
    }
    
    backup { "webmin_logs": 
        frequency => "${webmin::params::backup_frequency}",
        path      => "${webmin::params::logdir}",
        enabled   => "${webmin::params::backup_log_enable}",
        target    => "${webmin::params::backup_target_real}",
    }

    # Include project specific backup class if $my_project is set
    if $my_project { include "webmin::${my_project}::backup" }

}
