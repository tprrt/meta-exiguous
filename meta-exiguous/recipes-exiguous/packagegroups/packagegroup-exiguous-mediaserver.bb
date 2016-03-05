#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

SUMMARY = "Exiguous mediaserver's features"
DESCRIPTION = "Merge machine and distro options to create a mediaserver based on Exiguous."

AUTHOR = "Thomas Perrot <thomas.perrot@tupi.fr>"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

PR = "r0"

inherit packagegroup

# FIXME [exiguous] Clean and push packagegroup-exiguous-mediaserver
RDEPENDS_${PN} += ""
