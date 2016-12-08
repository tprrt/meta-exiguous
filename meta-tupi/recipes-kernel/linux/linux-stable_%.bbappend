#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

FILESEXTRAPATHS_prepend := "${THISDIR}/files/${MACHINE}:"

SRC_URI += "file://defconfig"

COMPATIBLE_MACHINE_tupi-desktop-z77 = "tupi-desktop-z77"
DEFAULT_PREFERENCE_tupi-desktop-z77 = "1"

COMPATIBLE_MACHINE_tupi-htpc-rpi2 = "tupi-htpc-rpi2"
DEFAULT_PREFERENCE_tupi-htpc-rpi2 = "1"

COMPATIBLE_MACHINE_tupi-nas-b75m = "tupi-nas-b75m"
DEFAULT_PREFERENCE_tupi-nas-b75m = "1"

COMPATIBLE_MACHINE_tupi-router-bbb = "tupi-router-bbb"
DEFAULT_PREFERENCE_tupi-router-bbb = "1"

COMPATIBLE_MACHINE_tupi-laptop-x220 = "tupi-laptop-x220"
DEFAULT_PREFERENCE_tupi-laptop-x220 = "1"
