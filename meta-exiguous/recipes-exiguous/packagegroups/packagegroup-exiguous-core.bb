#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

SUMMARY = "Exigous core"
DESCRIPTION = "Merge machine and distro options to create a basic machine task/package for Exiguous"

AUTHOR = "Thomas Perrot <thomas.perrot@tupi.fr>"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

PR = "r1"

inherit packagegroup

PROVIDES = "${PACKAGES}"

PACKAGES = "${PN}-core \
            ${PN}-core-kernel \
            ${PN}-core-system \
            ${PN}-core-optimization \
            ${PN}-core-network \
            ${PN}-core-security \
           "

SUMMARY_${PN}-core = "Exiguous core packages"
RDEPENDS_${PN}-core = "${MACHINE_HWCODECS} \
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
RDEPENDS_${PN}-core-kernel = ""
ALLOW_EMPTY_${PN}-core-kernel = "1"

SUMMARY_${PN}-core-system = "Exiguous core system package"
RDEPENDS_${PN}-core-system = "tzdata \
                              procps \
                              busybox \
                              systemd \
                              watchdog \
                              cronie \
                              dbus \
                              udisks \
                              cryptsetup \
                              lvm2 \
                              lxc \
                              rsync \
                              pigz \
                              pm-utils \
                              thermald \
                              ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "acpid", "", d)} \
                              ${@bb.utils.contains("MACHINE_FEATURES", "apm", "apmd", "", d)} \
                             "

# FIXME [exiguous] Enable zram only if a swap partition is used by the machine

SUMMARY_${PN}-core-optimization = "Exiguous core optimization package"
RDEPENDS_${PN}-core-optimization = "prelink \
                                    preload \
                                    zram \
                                   "

SUMMARY_${PN}-core-network = "Exiguous core network package"
RDEPENDS_${PN}-core-network = "nftables \
                               avahi-daemon \
                               avahi-utils \
                               packagegroup-core-ssh-dropbear \
                               packagegroup-core-nfs-server \
                               samba \
                              "

SUMMARY_${PN}-core-security = "Exiguous core security package"
RDEPENDS_${PN}-core-security = "fail2ban \
                                denyhosts \
                               "
