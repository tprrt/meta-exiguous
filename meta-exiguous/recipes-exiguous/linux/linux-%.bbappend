#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

AUTHOR = "Thomas Perrot <thomas.perrot@tupi.fr>"

FILESEXTRAPATHS_prepend := "${THISDIR}/linux-exiguous:"

LINUX_VERSION_EXTENSION = "-exiguous-${LINUX_KERNEL_TYPE}"

KCONFIG_MODE = "--allnoconfig"

LINUX_KERNEL_TYPE = "tiny"

INITRAMFS_IMAGE = "exiguous-image-initramfs"

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
            \
            ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "file://systemd.cfg", "", d)} \
            \
            ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "file://debug.cfg", "", d)} \
           "

# NB: APPEND being the name of the variable that is passed to the kernel by the
# boot loader.

# FIXME [exiguous] Add earlyprintk to the kernel cmdline

# FIXME [exiguous] Add console to the kernel cmdline

# FIXME [exiguous] Add netconsole to the kernel cmdline
# netconsole
# NETCONSOLE_PORT ?= "6666"
# NETCONSOLE_IP ?= "192.168.0.10"
# NETCONSOLE_DEVICE ?= "eth0"
# CMDLINE += "netconsole=${NETCONSOLE_PORT}@${NETCONSOLE_IP}/${NETCONSOLE_DEVICE},${NETCONSOLE_PORT}@${NETCONSOLE_IP}/${NETCONSOLE_DEVICE}"

CMDLINE = " \
    init=/init \
    panic=10 \
    memtest=5 \
    crashkernel=512M-2G:64M@64M,2G-:128M@128M \
    \
    loglevel=${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "7", "d", d)} \
"

do_kernel_configme_append() {
	TRIMMED=$(echo ${CMDLINE}|tr -s ' ')
	sed -i -e "s|^CONFIG_CMDLINE=.*$|CONFIG_CMDLINE=\"$TRIMMED\"|" ${KBUILD_OUTPUT}/.config
}
