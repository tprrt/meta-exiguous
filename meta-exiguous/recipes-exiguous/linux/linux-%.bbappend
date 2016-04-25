#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

AUTHOR = "Thomas Perrot <thomas.perrot@tupi.fr>"

DEPENDS += "lz4-native"

FILESEXTRAPATHS_prepend := "${THISDIR}/linux-exiguous:"

LINUX_VERSION_EXTENSION = "-${DISTRO}-${LINUX_KERNEL_TYPE}"

# INITRAMFS_IMAGE = "exiguous-image-initramfs"
# INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_image_complete"

SRC_URI += "file://embedded.cfg \
            file://watchdog.cfg \
            file://security.cfg \
            file://initramfs.cfg \
            file://earlyprintk.cfg \
            file://netconsole.cfg \
            file://memtest.cfg \
            file://kdump.cfg \
            file://loop.cfg \
            file://uptime.cfg \
            file://tpm.cfg \
            file://nmi.cfg \
            file://crypto.cfg \
            file://lz4.cfg \
            file://overlayfs.cfg \
            \
            ${@bb.utils.contains("TUNE_FEATURES", "neon", "file://crypto-arm.cfg", "", d)} \
            ${@bb.utils.contains("TUNE_FEATURES", "aarch64", "file://crypto-arm64.cfg", "", d)} \
            ${@bb.utils.contains("TUNE_FEATURES", "corei7", "file://crypto-intel.cfg", "", d)} \
            \
            ${@bb.utils.contains("TUNE_FEATURES", "corei7", "file://microcode.cfg", "", d)} \
            \
            ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "file://systemd.cfg", "", d)} \
            \
            ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "file://debug.cfg", "", d)} \
            \
            ${@bb.utils.contains("EXIGUOUS_PROFILING", "Yes", "file://profiling.cfg", "", d)} \
           "

# FIXME [exiguous] Enable the support of USB Null-Modem cable

CMDLINE += "init=/init \
            memtest=5 \
            crashkernel=512M-2G:64M@64M,2G-:128M@128M \
            \
            loglevel=${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "7", "4", d)} \
           "

do_kernel_configme_append() {
        TRIMMED=$(echo ${CMDLINE}|tr -s " ")
        sed -i -e "s|^CONFIG_CMDLINE=.*$|CONFIG_CMDLINE=\"$TRIMMED\"|" ${KBUILD_OUTPUT}/.config
}
