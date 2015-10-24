SUMMARY = "Linux thermal daemon"

DESCRIPTION = "Thermal Daemon is a Linux daemon used to prevent the \
overheating of platforms. This daemon monitors temperature and applies \
compensation using available cooling methods."

HOMEPAGE = "https://github.com/01org/thermal_daemon"

PV = "1.4.3"
SRC_URI = "https://github.com/01org/thermal_daemon/archive/v${PV}.tar.gz"

SRC_URI[md5sum] = "11d9415ab6638ee47cfb09ac9706d3b8"
SRC_URI[sha256sum] = "566595eb2c56679d463be5a65d612de90968248054122bb390d0bc902ba7b762"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=ea8831610e926e2e469075b52bf08848"

SECTION = "base"

DEPENDS = "dbus dbus-glib libxml2"

# RDEPENDS = ""

PR = "r0"

S = "${WORKDIR}/thermal_daemon-${PV}"

inherit autotools pkgconfig
