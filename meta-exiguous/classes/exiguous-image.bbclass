#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

SUMMARY = "Exiguous distribution image class"
DESCRIPTION = "Exiguous distribution image class"
AUTHOR = "Thomas Perrot <thomas.perrot@tupi.fr>"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

# -----------------------------------------------------------------------------
# Define image's features of Exiguous
# -----------------------------------------------------------------------------

FEATURE_PACKAGES_tools-sdk = "packagegroup-core-sdk \
                              packagegroup-core-standalone-sdk-target \
                             "
FEATURE_PACKAGES_tools-debug = "packagegroup-core-tools-debug"
FEATURE_PACKAGES_tools-profile = "packagegroup-core-tools-profile"
FEATURE_PACKAGES_tools-testapps = "packagegroup-core-tools-testapps"
FEATURE_PACKAGES_eclipse-debug = "packagegroup-core-eclipse-debug"

FEATURE_PACKAGES_exiguous-ci = "packagegroup-exiguous-ci"
FEATURE_PACKAGES_exiguous-htpc = "packagegroup-exiguous-htpc"
FEATURE_PACKAGES_exiguous-mediaserver = "packagegroup-exiguous-mediaserver"
FEATURE_PACKAGES_exiguous-nas = "packagegroup-exiguous-nas"
FEATURE_PACKAGES_exiguous-router = "packagegroup-exiguous-router"
FEATURE_PACKAGES_exiguous-station = "packagegroup-exiguous-station"

# -----------------------------------------------------------------------------
# Properties of Exiguous's images
# -----------------------------------------------------------------------------

# FIXME [exiguous] Workaround to fix initramfs build issue
do_rootfs[depends] += "exiguous-image-initramfs:do_rootfs"

# FIXME [exiguous] Re-enable read-only-rootfs

IMAGE_LINGUAS = ""

USE_DEVFS = "1"
USE_DEVMOD = "1"

IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "" ,d)}"

# Also removed from the busybox recipe
BAD_RECOMMENDATIONS += "busybox-syslog busybox-udhcpc"

export IMAGE_BASENAME = "exiguous-image"

inherit exiguous-squashfs-lz4 image
