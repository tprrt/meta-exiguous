inherit image_types

IMAGE_CMD_squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lz4 ${EXTRA_IMAGECMD} -noappend -comp lz4 -Xhc"

IMAGE_DEPENDS_squashfs-lz4 = "squashfs-tools-native"

IMAGE_TYPES += "squashfs-lz4"
