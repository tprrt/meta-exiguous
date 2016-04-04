RDEPENDS_${PN}_remove = "lsb"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-no-pgpin-in-vmstat.patch \
	    preload.init \
	    preload.service \
	   "

inherit systemd

do_install_append() {
    install -d ${D}${systemd_unitdir}/system
    install -m 0644 ${WORKDIR}/tcsd.service ${D}${systemd_unitdir}/system/
    sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/preload.service
}

SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE_${PN} = "preload.service"
SYSTEMD_AUTO_ENABLE_${PN} = "enable"
