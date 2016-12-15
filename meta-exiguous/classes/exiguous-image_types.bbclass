#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

inherit image_types

IMAGE_CMD_TAR = "tar --acls --xattrs --xattrs-include=*"
EXTRANATIVEPATH += "tar-native"

# u-boot image
# -----------------------------------------------------------------------------

# CONVERSIONTYPES += "lz4.u-boot"

# CONVERSION_DEPENDS_lz4.u-boot = "u-boot-mkimage-native"
# CONVERSION_CMD_lz4.u-boot = "${CONVERSION_CMD_lz4}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lz4 lz4 clean"

# initramfs image
# -----------------------------------------------------------------------------

# CONVERSIONTYPES += "cpio.lz4"

# CONVERSION_DEPENDS_cpio.lz4 = "u-boot-mkimage-native"
# CONVERSION_cpio.lz4 = "${CONVERSION_CMD_lz4}; oe_mkimage ${IMAGE_NAME}.rootfs.${type}.lz4 lz4 clean"

# rootfs image
# -----------------------------------------------------------------------------

IMAGE_CMD_squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lz4 ${EXTRA_IMAGECMD} -noappend -comp lz4 -Xhc"

IMAGE_DEPENDS_squashfs-lz4 = "squashfs-tools-native"

IMAGE_TYPES += "squashfs-lz4"
