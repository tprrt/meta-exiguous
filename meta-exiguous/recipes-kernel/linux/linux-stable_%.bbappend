#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

FILESEXTRAPATHS_prepend := "${THISDIR}/files/qemu-exiguous:"

SRC_URI_append_qemu-exiguous = "file://defconfig"

COMPATIBLE_MACHINE_qemu-exiguous = "qemu-exiguous"
DEFAULT_PREFERENCE_qemu-exiguous = "1"
