#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

SUMMARY = "Merge machine and distro options to create a basic machine task/package"
DESCRIPTION = ""

AUTHOR = "Thomas Perrot <thomas.perrot@tupi.fr>"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

PR = "r0"

inherit packagegroup

PROVIDES = "${PACKAGES}"

PACKAGES = " \
    ${PN}-core \
    ${PN}-core-kernel \
    ${PN}-core-system \
    ${PN}-core-optimization \
    ${PN}-core-network \
    ${PN}-core-security \
    \
    ${PN}-extra \
    ${PN}-extra-debug-tools \
    ${PN}-extra-debug-symbols \
    ${PN}-extra-profiling \
    ${PN}-extra-tests \
    ${PN}-extra-security-analysis \
    \
    ${PN}-features \
    ${PN}-features-station \
    ${PN}-features-router \
    ${PN}-features-nas \
    ${PN}-features-mediaserver \
    ${PN}-features-htpc \
    ${PN}-features-ci \
    "

# -----------------------------------------------------------------------------
# Exiguous core packages
# -----------------------------------------------------------------------------

SUMMARY_${PN}-core = "Exiguous core packages"
RDEPENDS_${PN}-core = " \
    ${MACHINE_HWCODECS} \
    \
    packagegroup-core-boot \
    \
    ${PN}-core-kernel \
    ${PN}-core-system \
    ${PN}-core-optimization \
    ${PN}-core-network \
    ${PN}-core-security \
    "

SUMMARY_${PN}-core-kernel = "Exiguous core kernel package"
RDEPENDS_${PN}-core-kernel = "kernel-modules"
RRECOMMENDS_${PN}-core-kernel = "kernel-module-af-packet"

SUMMARY_${PN}-core-system = "Exiguous core system package"
RDEPENDS_${PN}-core-system = " \
    acl tzdata procps \
    busybox systemd watchdog cronie dbus udisks cryptsetup lvm2 \
    rsync pigz \
    pm-utils acpid thermald \
    "

# FIXME [exiguous] Enable zram only if a swap partition is used by the machine

SUMMARY_${PN}-core-optimization = "Exiguous core optimization package"
RDEPENDS_${PN}-core-optimization = " \
    prelink \
    zram \
    "

SUMMARY_${PN}-core-network = "Exiguous core network package"
RDEPENDS_${PN}-core-network = " \
    iptables \
    avahi-daemon avahi-utils \
    packagegroup-core-ssh-dropbear \
    packagegroup-core-nfs-server \
    samba \
    "

SUMMARY_${PN}-core-security = "Exiguous core security package"
RDEPENDS_${PN}-core-security = " \
    audit \
    packagegroup-core-selinux \
    "

# -----------------------------------------------------------------------------
# Exiguous extra packages
# -----------------------------------------------------------------------------

SUMMARY_${PN}-extra = "Exiguous extra packages"
RDEPENDS_${PN}-extra = " \
    ${PN}-extra-debug-tools \
    ${PN}-extra-debug-symbols \
    ${PN}-extra-tests \
    ${PN}-extra-profiling \
    ${PN}-extra-security-analysis \
    "
ALLOW_EMPTY_${PN}-extra = "1"

SUMMARY_${PN}-extra-debug = "Exiguous extra debug package"
RDEPENDS_${PN}-extra-debug = " \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "crash", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "gdbserver", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "gdb", "", d)} \
    "
ALLOW_EMPTY_${PN}-extra-debug = "1"

# FIXME [exiguous] Clean and push Exiguous debug symbols package
SUMMARY_${PN}-extra-debug-symbols = "Exiguous extra debug symbols package"
RDEPENDS_${PN}-extra-debug-symbols = ""
ALLOW_EMPTY_${PN}-extra-debug-symbols = "1"

# FIXME [exiguous] Clean and push Exiguous tests package
SUMMARY_${PN}-extra-tests = "Exiguous extra tests package"
RDEPENDS_${PN}-extra-tests = ""
ALLOW_EMPTY_${PN}-extra-tests = "1"

SUMMARY_${PN}-extra-profiling = "Exiguous extra profiling package"
RDEPENDS_${PN}-extra-profiling = " \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "strace", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "ltrace", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "perf", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "oprofile", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "valgrind", "", d)} \
    "
ALLOW_EMPTY_${PN}-extra-profiling = "1"

SUMMARY_${PN}-extra-security-analysis = "Exiguous extra security analysis package"
RDEPENDS_${PN}-extra-security-analysis = " \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "checksec", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "nmap", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "nikto", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "checksecurity", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "buck-security", "", d)} \
    "
ALLOW_EMPTY_${PN}-extra-security = "1"

# -----------------------------------------------------------------------------
# Exiguous additional features packages
# -----------------------------------------------------------------------------

SUMMARY_${PN}-features = "Exiguous features packages"
RDEPENDS_${PN}-features = " \
    ${PN}-features-station \
    ${PN}-features-router \
    ${PN}-features-nas \
    ${PN}-features-mediaserver \
    ${PN}-features-htpc \
    ${PN}-features-ci \
    "
ALLOW_EMPTY_${PN}-features = "1"

SUMMARY_${PN}-features-station = "Exiguous extra station package"
RDEPENDS_${PN}-features-station = " \
    ${@bb.utils.contains("IMAGE_FEATURES", "exiguous-station", "sudo", "", d)} \
    ${@bb.utils.contains("IMAGE_FEATURES", "exiguous-station", "wayland", "", d)} \
    ${@bb.utils.contains("IMAGE_FEATURES", "exiguous-station", "packagegroup-xfce-base", "", d)} \
    ${@bb.utils.contains("IMAGE_FEATURES", "exiguous-station", "packagegroup-xfce-extended", "", d)} \
    ${@bb.utils.contains("IMAGE_FEATURES", "exiguous-station", "packagegroup-xfce-multimedia", "", d)} \
    "
ALLOW_EMPTY_${PN}-features-station = "1"

# FIXME [exiguous] Clean and push ${PN}-features-router
SUMMARY_${PN}-features-router = "Exiguous extra router package"
RDEPENDS_${PN}-features-router = ""
ALLOW_EMPTY_${PN}-features-router= "1"

SUMMARY_${PN}-features-nas = "Exiguous extra nas package"
RDEPENDS_${PN}-features-nas = " \
    ${@bb.utils.contains("IMAGES_FEATURES", "exiguous-nas", "mdadm", "", d)} \
    "
ALLOW_EMPTY_${PN}-features-nas = "1"

# FIXME [exiguous] Clean and push ${PN}-features-mediaserver
SUMMARY_${PN}-features-mediaserver = "Exiguous extra mediaserver package"
RDEPENDS_${PN}-features-mediaserver = ""
ALLOW_EMPTY_${PN}-features-mediaserver = "1"

# FIXME [exiguous] Clean and push ${PN}-features-htpc
SUMMARY_${PN}-features-htpc = "Exiguous extra htpc package"
RDEPENDS_${PN}-features-htpc = ""
ALLOW_EMPTY_${PN}-features-htpc = "1"

# FIXME [exiguous] Clean and push ${PN}-features-ci
SUMMARY_${PN}-features-ci = "Exiguous extra ci package"
RDEPENDS_${PN}-features-ci = ""
ALLOW_EMPTY_${PN}-features-ci = "1"
