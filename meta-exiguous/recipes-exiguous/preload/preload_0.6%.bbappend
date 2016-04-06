RDEPENDS_${PN}_remove = "lsb"

inherit systemd

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://preload.init \
            file://preload.service \
            file://0001-no-pgpin-in-vmstat.patch \
           "

do_install_append() {
    rm -rf ${D}/${sysconfdir}/rc.d
    rm -rf ${D}/${sysconfdir}/var/lib/preload

    install -d ${D}/${sysconfdir}/init.d
    install -m 0775 ${WORKDIR}/preload.init ${D}/${sysconfdir}/init.d/preload

    install -d ${D}${systemd_unitdir}/system
    install -m 644 ${WORKDIR}/preload.service ${D}${systemd_unitdir}/system
}

FILES_${PN} += "${systemd_unitdir}/system/*"

SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE_${PN} = "preload.service"
SYSTEMD_AUTO_ENABLE_${PN} = "enable"
