#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

DESCRIPTION = "Linux stable security"

AUTHOR = "Thomas Perrot <thomas.perrot@tupi.fr>"

SECTION = "kernel"

LINUX_VERSION_EXTENSION ?= "-security"

LINUX_VERSION ?= "4.1"

KBRANCH ?= "${@bb.utils.contains('MACHINEOVERRIDES', 'raspberrypi', 'rpi-4.1.y-security', 'linux-4.1.y-security', d)}"

SRCREV ?= "${AUTOREV}"
SRCREV_machine ?= "${AUTOREV}"

PV = "${LINUX_VERSION}"
PV_append = "+git${SRCPV}"

# SRC_URI ?= "git://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable-security.git;protocol=git;branch=${KBRANCH}"
SRC_URI ?= "git://github.com/tprrt/linux-stable-security.git;protocol=git;branch=${KBRANCH}"

require ${@bb.utils.contains('MACHINEOVERRIDES', 'raspberrypi', 'recipes-kernel/linux/linux-raspberrypi.inc', 'recipes-kernel/linux/linux-yocto.inc', d)}

KCONFIG_MODE ?= "--allnoconfig"

KCONF_AUDIT_LEVEL ?= "2"
KCONF_BSP_AUDIT_LEVEL ?= "2"
