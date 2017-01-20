SUMMARRY = "Fail2ban scans log files and bans IPs that show the malicious signs"

DESCRIPTION = "Fail2Ban is able to reduce the rate of incorrect \
authentications attempts however it cannot eliminate the risk that weak \
authentication presents. Configure services to use only two factor or \
public/private authentication mechanisms if you really want to protect services."

HOMEPAGE = "http://www.fail2ban.org"

PV = "0.9.3"

SRC_URI = "https://github.com/fail2ban/fail2ban/archive/${PV}.tar.gz"

SRC_URI[md5sum] = "73c87c545cc6474de984b5a05e64ecab"
SRC_URI[sha256sum] = "b3a0793d9ed3b4e341e568388c65bb07a904f77ac8044186376cab3e58e5b2c9"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=ecabc31e90311da843753ba772885d9f"

SECTION = "security"

PR = "r0"

inherit setuptools systemd

FILES_${PN} += "/run"

SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE_${PN} = "fail2ban.service"
SYSTEMD_AUTO_ENABLE_${PN} = "enable"
