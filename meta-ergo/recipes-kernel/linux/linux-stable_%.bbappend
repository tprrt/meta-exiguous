#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

FILESEXTRAPATHS_prepend := "${THISDIR}/files/${MACHINE}:"

SRC_URI += "file://defconfig"

COMPATIBLE_MACHINE_ergo-bbb = "ergo-bbb"
DEFAULT_PREFERENCE_ergo-bbb = "1"

COMPATIBLE_MACHINE_ergo-rpi = "ergo-rpi"
DEFAULT_PREFERENCE_ergo-rpi = "1"
