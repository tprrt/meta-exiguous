#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

AUTHOR = "Thomas Perrot <thomas.perrot@tupi.fr>"

LINUX_VERSION = "4.1"

KBRANCH = "${@bb.utils.contains('MACHINEOVERRIDES', 'raspberrypi', 'rpi-4.1.y-security', 'linux-4.1.y-security', d)}"

SRCREV = "${@bb.utils.contains('MACHINEOVERRIDES', 'raspberrypi', '3461a0944397365a5c007f6198df7912381d30c7', '93ac5dabc703265a96dc7e2376e13f5549b79dbb', d)}"

require recipes-kernel/linux/linux-stable-security.inc

