#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

AUTHOR = "Thomas Perrot <thomas.perrot@tupi.fr>"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://utils.cfg \
            file://no-udhcp.cfg \
           "

# Whether to split the suid apps into a seperate binary
BUSYBOX_SPLIT_SUID = "1"

RRECOMMENDS_${PN}_remove = "${PN}-syslog ${PN}-udhcpc"
