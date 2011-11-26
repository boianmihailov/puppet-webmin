# Class: webmin::disableboot
#
# This class disables webmin startup at boot time but doesn't check if the service is running
# Useful when the service is started but another applications (such as a Cluster suite)
#
# Usage:
# include webmin::disableboot
#
class webmin::disableboot inherits webmin {
    Service["webmin"] {
        enable => "false",
    }
}
