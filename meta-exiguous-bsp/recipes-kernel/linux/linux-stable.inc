#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

DESCRIPTION = "Linux stable"

AUTHOR = "Thomas Perrot <thomas.perrot@tupi.fr>"

SECTION = "kernel"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"

LINUX_VERSION_EXTENSION ?= "-stable"

LINUX_VERSION ?= "4.4"

KBRANCH ?= "linux-4.4.y"

SRCREV ?= "${AUTOREV}"
SRCREV_machine ?= "${AUTOREV}"

PV = "${LINUX_VERSION}"
PV_append = "+git${SRCPV}"

SRC_URI = "git://github.com/tprrt/linux-stable.git;protocol=git;branch=${KBRANCH}"

require recipes-kernel/linux/linux-yocto.inc

LINUX_KERNEL_TYPE ?= "tiny"
KCONFIG_MODE ?= "--allnoconfig"

KCONF_AUDIT_LEVEL ?= "2"
KCONF_BSP_AUDIT_LEVEL ?= "2"
