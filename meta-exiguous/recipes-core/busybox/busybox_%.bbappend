AUTHOR = "Thomas Perrot <thomas.perrot@tupi.fr>"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# FIXME [exiguous] Remove syslog udhcpc httpd mdev hwclock from busybox configuration

SRC_URI += "file://utils.cfg \
            file://no-udhcp.cfg \
            file://no-syslog.cfg \
           "

# Whether to split the suid apps into a seperate binary
BUSYBOX_SPLIT_SUID = "1"

RRECOMMENDS_${PN}_remove = "${PN}-syslog ${PN}-udhcpc"
