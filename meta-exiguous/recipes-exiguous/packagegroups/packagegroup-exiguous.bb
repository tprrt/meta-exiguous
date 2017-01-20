#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

SUMMARY = "Exigous core"
DESCRIPTION = "Merge machine and distro options to create a basic machine task/package for Exiguous"

AUTHOR = "Thomas Perrot <thomas.perrot@tupi.fr>"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

PR = "r1"

inherit packagegroup

SUMMARY_${PN} = "Exiguous core packages"
RDEPENDS_${PN} = "procps \
                  busybox \
                  preload \
                  dropbear \
                  nftables \
                  fail2ban \
                  denyhosts \
                  zram \
                 "
