# Define webmin::conf
#
# General webmin main configuration file's inline modification define
# Use with caution, it's still at experimental stage and may break in untested circumstances
# Engine, pattern end line parameters can be tweaked for better behaviour
#
# Usage:
# webmin::conf    { "mynetworks":  value => "127.0.0.0/8 10.42.42.0/24" }
#
define webmin::conf ($value) {

    require webmin::params

    config { "webmin_conf_$name":
        file      => "${webmin::params::configfile}",
        line      => "$name = $value",
        pattern   => "^$name ",
        engine    => "replaceline",
        notify    => Service["webmin"],
        require   => File["webmin.conf"],
    }

}
