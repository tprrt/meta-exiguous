#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

SUMMARY = "Exiguous DEV image"

DESCRIPTION = "Image with Exiguous for development work. It includes everything \
within exiguous-image plus a native toolchain, application development and \
testing libraries, profiling and debug symbols."

AUTHOR = "Thomas Perrot <thomas.perrot@tupi.fr>"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

# NB: exiguous-image is a subclass of image class, define additional
# feature packages and set some image's attributs.

inherit exiguous-image

IMAGE_FEATURES_append = " dev-pkgs"

IMAGE_INSTALL_append = " kernel-dev"

export IMAGE_BASENAME = "exiguous-image-dev"
