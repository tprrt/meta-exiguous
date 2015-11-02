#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

SUMMARY = "Exiguous distribution image class"
DESCRIPTION = "Exiguous distribution image class"
AUTHOR = "Thomas Perrot <thomas.perrot@tupi.fr>"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

# -----------------------------------------------------------------------------
# Define packages for features of Exiguous
# -----------------------------------------------------------------------------

FEATURE_PACKAGES_exiguous-station = "packagegroup-exiguous-features-station"
FEATURE_PACKAGES_exiguous-router = "packagegroup-exiguous-features-router"
FEATURE_PACKAGES_exiguous-nas = "packagegroup-exiguous-features-nas"
FEATURE_PACKAGES_exiguous-mediaserver = "packagegroup-exiguous-features-mediaserver"
FEATURE_PACKAGES_exiguous-htpc = "packagegroup-exiguous-features-htpc"
FEATURE_PACKAGES_exiguous-ci = "packagegroup-exiguous-features-ci"

# -----------------------------------------------------------------------------
# Exiguous image properties
# -----------------------------------------------------------------------------

# FIXME [exiguous] Re-enable read-only-rootfs

# Specifies a list of distro-specific features to INSTALL to ALL Exiguous images.
IMAGE_FEATURES_append = " \
    ${@bb.utils.contains("EXIGUOUS_FEATURES_CI", "Yes", "exiguous-ci", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_FEATURES_HTPC", "Yes", "exiguous-htpc", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_FEATURES_MEDIASERVER", "Yes", "exiguous-mediaserver", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_FEATURES_NAS", "Yes", "exiguous-nas", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_FEATURES_ROUTER", "Yes", "exiguous-router", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_FEATURES_STATION", "Yes", "exiguous-station", "", d)} \
"

USE_DEVFS = "1"
USE_DEVMOD = "1"

IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "" ,d)}"

# Already remove into busybox_%.bbappend
# BAD_RECOMMENDATIONS += "busybox-syslog busybox-udhcpc"

export IMAGE_BASENAME = "exiguous-image"

inherit image

python __anonymous() {
    all_features = bb.data.getVar("EXIGUOUS_FEATURES_ALL", d, 1)
    all = bb.data.getVar("EXIGUOUS_ALL", d, 1)
    if all_features == "Yes" or all == "Yes":
        bb.data.setVar("EXIGUOUS_FEATURES_CI", "Yes", d)
        bb.data.setVar("EXIGUOUS_FEATURES_HTPC", "Yes", d)
        bb.data.setVar("EXIGUOUS_FEATURES_MEDIASERVER", "Yes", d)
        bb.data.setVar("EXIGUOUS_FEATURES_NAS", "Yes", d)
        bb.data.setVar("EXIGUOUS_FEATURES_ROUTER", "Yes", d)
        bb.data.setVar("EXIGUOUS_FEATURES_STATION", "Yes", d)
}
