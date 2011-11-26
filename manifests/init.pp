#
# Class: webmin
#
# Manages webmin.
# Include it to install and run webmin
# It defines package, service, main configuration file.
#
# Usage:
# include webmin
#


class webmin {
	file {"/etc/apt/sources.list.d/webmin.list":
		ensure => present,
		content => "deb http://download.webmin.com/download/repository sarge contrib
deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib"
	}

    $archive = "/root/$base"
    $installed = "/etc/webmin/version"

#    package { "libnet-ssleay-perl": ensure => installed }
#    package { "libauthen-pam-perl": ensure => installed }
#    package { "libio-pty-perl": ensure => installed }
#    package { "libmd5-perl": ensure => installed }

    service { webmin:
        ensure => running,
        require => Exec["InstallWebmin"],
        provider => init;
    }


	
    exec { "DownloadWebmin":
        cwd => "/root",
        command => "wget http://www.webmin.com/jcameron-key.asc && apt-key add jcameron-key.asc",
        creates => "/root/jcameron-key.asc"
    }
	

	
    exec { "InstallWebmin":
        cwd => "/root",
        command => "apt-get update && apt-get install -y webmin",
        creates => $installed,
        require => Exec["DownloadWebmin"],
        notify => Service[webmin],
    }

}
