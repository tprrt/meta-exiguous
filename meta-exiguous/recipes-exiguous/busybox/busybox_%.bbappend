#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://exiguous-core.cfg \
            \
            file://no-udhcp.cfg \
           "

# For the BusyBox recipe, specifies whether to split the output executable file
# into two parts: one for features that require setuid root, and one for the remaining features.
BUSYBOX_SPLIT_SUID = "1"

RRECOMMENDS_${PN}_remove = "${PN}-syslog ${PN}-udhcpc"
