#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

SUMMARY = "Exiguous image types class"
DESCRIPTION = "Define additional image types to build image containing luks and lvm partitions"
AUTHOR = "Thomas Perrot <thomas.perrot@tupi.fr>"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

inherit image_types

# FIXME Complete exiguous-image.bbclass

# -----------------------------------------------------------------------------
# COMMON
# -----------------------------------------------------------------------------

# FIXME [exiguous] exiguous-image-luks __anonymous

python __anonymous() {
    # Check machine compatibility
    supported_machines = []
    current_machine = bb.data.getVar("MACHINE", d, 1)
    if not  current_machine in supported_machines:
        raise bb.parse.SkipPackage("Exiguous is not supported on %s" % (current_machine))

#     # Enable tasks to build Exiguous image
#     if bb.utils.contains("IMAGE_FSTYPES", "luks", True, False, d):
#         bb.build.addtask('???_do_luks', 'do_build', 'do_rootfs', d)
#
#     elif bb.utils.contains("IMAGE_FSTYPES", "lvm", True, False, d):
#         bb.build.addtask('???_do_lvm', 'do_build', 'do_rootfs', d)
#
#     elif bb.utils.contains("IMAGE_FSTYPES", "lvm-on-luks", True, False, d):
#         bb.build.addtask('???_do_lvm-on-luks', 'do_build', '???after_do_luks', d)
#
#     else:
#         bb.build.addtask('???', '???before', '???after', d)
}

# -----------------------------------------------------------------------------
# LUKS
# -----------------------------------------------------------------------------

LUKS_ROOTFS_TYPE ?= "ext4"
IMAGE_TYPEDEP_luks = "${LUKS_ROOTFS_TYPE}"

IMAGE_TYPES_MASKED += "luks"

IMAGE_DEPENDS_luks = "cryptsetup-native"

LUKS_IMAGE_PATH = "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.luks"

exiguous_img_luks_post_cmd() {
    # FIXME [exiguous] exiguous_img_luks_post_cmd
}

ROOTFS_POSTPROCESS_COMMAND_append = " exiguous_img_luks_post_cmd"

# -----------------------------------------------------------------------------
# LVM
# -----------------------------------------------------------------------------

# LVM_ROOTFS_TYPE ?= "ext4"
# IMAGE_TYPEDEP_lvm = "${LVM_ROOTFS_TYPE}"

IMAGE_TYPES_MASKED += "lvm"

IMAGE_DEPENDS_lvm = "lvm2-native"

LVM_IMAGE_PATH = "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.lvm"

exiguous_img_lvm_post_cmd() {
    # FIXME [exiguous] exiguous_img_lvm_post_cmd
}

ROOTFS_POSTPROCESS_COMMAND_append = " exiguous_img_lvm_post_cmd"

# -----------------------------------------------------------------------------
# LVM-ON-LUKS
# -----------------------------------------------------------------------------

# LVM-ON-LUKS_ROOTFS_TYPE = "ext4"
# IMAGE_TYPEDEP_lvm-on-luks = "${LVM-ON-LUKS_ROOTFS_TYPE}"

IMAGE_TYPES_MASKED += "lvm-on-luks"

IMAGE_DEPENDS_lvm-on-luks = "${IMAGE_DEPENDS_lvm} ${IMAGE_DEPENDS_luks}"
LVM-ON-LUKS_IMAGE_PATH = "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.lvm-on-luks"

exiguous_img_lvm-on-luks_post_cmd() {
    # FIXME [exiguous] exiguous_img_lvm-on-luks_post_cmd
}

ROOTFS_POSTPROCESS_COMMAND_append = " exiguous_img_lvm-on-luks_post_cmd"

# -----------------------------------------------------------------------------
# LXC
# -----------------------------------------------------------------------------
