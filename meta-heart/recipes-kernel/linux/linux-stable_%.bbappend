#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

FILESEXTRAPATHS_prepend := "${THISDIR}/files/${MACHINE}:"

SRC_URI += "file://defconfig"

COMPATIBLE_MACHINE_heart-rpi = "heart-rpi"
DEFAULT_PREFERENCE_heart-rpi = "1"
