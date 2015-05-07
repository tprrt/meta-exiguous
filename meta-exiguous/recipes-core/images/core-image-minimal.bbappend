#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

IMAGE_FEATURES_remove = "ssh-server-openssh"
IMAGE_FEATURES_append = " ssh-server-dropbear"

IMAGE_FEATURES_append = " hwcodecs read-only-rootfs nfs-server"

IMAGE_INSTALL_remove = "packagegroup-core-ssh-openssh"
IMAGE_INSTALL_append = " \
   kernel-modules \
   packagegroup-core-selinux \
   packagegroup-core-ssh-dropbear \
"
