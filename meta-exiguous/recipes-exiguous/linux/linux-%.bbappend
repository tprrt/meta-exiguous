#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

AUTHOR = "Thomas Perrot <thomas.perrot@tupi.fr>"

DEPENDS += "lz4-native"

FILESEXTRAPATHS_prepend := "${THISDIR}/files/exiguous:"

KCONFIG_MODE = "--allnoconfig"

KCONF_AUDIT_LEVEL = "2"
KCONF_BSP_AUDIT_LEVEL = "2"

INITRAMFS_FSTYPES = "cpio.lz4"

# INITRAMFS_IMAGE = "exiguous-image-initramfs"
# INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_image_complete"

SRC_URI_append = " file://embedded.cfg \
                   file://watchdog.cfg \
		   file://rtc.cfg \
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
		   file://dm-crypt.cfg \
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

CMDLINE_append = " init=/init \
                   memtest=5 \
                   crashkernel=512M-2G:64M@64M,2G-:128M@128M \
                   \
                   loglevel=${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "7", "4", d)} \
                   ${@bb.utils.contains("VIRTUAL-RUNTIME_init_manager", "systemd", bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "systemd.log_level=debug", "", d), "", d)} \
                 "

do_kernel_configme_append() {
        # Set the kernel cmdline
        TRIMMED=$(echo ${CMDLINE}|tr -s " ")
        sed -i -e "s|^CONFIG_CMDLINE=.*$|CONFIG_CMDLINE=\"${TRIMMED}\"|" ${KBUILD_OUTPUT}/.config

        # Set the default hostname
        sed -i -e "s|^CONFIG_DEFAULT_HOSTNAME=.*$|CONFIG_DEFAULT_HOSTNAME=\"${MACHINE}\"|" ${KBUILD_OUTPUT}/.config
}
