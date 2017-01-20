#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

# -----------------------------------------------------------------------------
# Define package features of Exiguous
# -----------------------------------------------------------------------------

FEATURE_PACKAGES_exiguous-ci = "packagegroup-exiguous-ci"
FEATURE_PACKAGES_exiguous-htpc = "packagegroup-exiguous-htpc"
FEATURE_PACKAGES_exiguous-mediaserver = "packagegroup-exiguous-mediaserver"
FEATURE_PACKAGES_exiguous-nas = "packagegroup-exiguous-nas"
FEATURE_PACKAGES_exiguous-router = "packagegroup-exiguous-router"
FEATURE_PACKAGES_exiguous-station = "packagegroup-exiguous-station"

# -----------------------------------------------------------------------------
# Properties of images
# -----------------------------------------------------------------------------

IMAGE_LINGUAS = ""

USE_DEVFS = "1"
USE_DEVMOD = "1"

IMAGE_ROOTFS_EXTRA_SPACE_append = "${@bb.utils.contains("DISTRO_FEATURES", "systemd", " + 4096", "" ,d)}"

# Also removed from the busybox recipe
BAD_RECOMMENDATIONS += "busybox-syslog busybox-udhcpc"

# Specifies a list of distro-specific features to INSTALL to ALL images.
IMAGE_FEATURES += "hwcodecs read-only-rootfs"

inherit core-image exiguous-rootfs-postcommands

export IMAGE_BASENAME = "exiguous-image"

# -----------------------------------------------------------------------------
# Properties of SDK
# -----------------------------------------------------------------------------

SDKIMAGE_FEATURES = "dev-pkgs dbg-pkgs gir-pkgs kernel-vmlinux kernel-dev"
