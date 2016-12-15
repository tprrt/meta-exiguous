#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"

# To avoid circular dependencies
EXTRA_IMAGEDEPENDS = ""

PACKAGE_INSTALL = "initramfs-exiguous"

# Do not pollute the initrd image with rootfs features
IMAGE_FEATURES = ""

IMAGE_LINGUAS = ""

FEED_DEPLOYDIR_BASE_URI = ""
LDCONFIGDEPEND = ""
USE_DEVFS = "1"
USE_DEPMOD = "0"
KERNELDEPMODDEPEND = ""

# Not to create additional free disk space
IMAGE_ROOTFS_EXTRA_SPACE = "0"

# Also removed from the busybox recipe
BAD_RECOMMENDATIONS += "busybox-syslog busybox-udhcpc"

export IMAGE_BASENAME = "exiguous-image-initramfs"

inherit image
