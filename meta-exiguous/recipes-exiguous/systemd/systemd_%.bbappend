#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

AUTHOR = "Thomas Perrot <thomas.perrot@tupi.fr>"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

# FIXME [exiguous] Fix the systemd recipe !!!!!

# SRC_URI_append = " file://50-default.conf \
#                    file://system.conf \
#                    file://user.conf \
#                    file://journald.conf \
#                  "

# To disable timesyncd if chrony are enabled
PACKAGECONFIG[chrony] = "--disable-timesyncd,--enable-timesyncd,chrony"

# -----------------------------------------------------------------------------
# Enable console-getty
# -----------------------------------------------------------------------------

# do_install_append () {
#     install -d ${D}${systemd_unitdir}/system/
#     install -d ${D}${sysconfdir}/systemd/system/getty.target.wants/

#     # Disable all getty services
#     rm -rf ${D}${sysconfdir}/systemd/system/getty.target.wants/*

#     # Enable only console-getty service
#     ln -sf ${systemd_unitdir}/system/console-getty.service \
#         ${D}${sysconfdir}/systemd/system/getty.target.wants/console-getty.service
# }

# -----------------------------------------------------------------------------
# Enable coredumpctl
# -----------------------------------------------------------------------------

# SRC_URI += "file://coredump.conf"

EXTRA_OECONF := "${@'${EXTRA_OECONF}'.replace('--disable-coredump', '--enable-coredump')}"

FILES_${PN} += "${bindir}/coredumpctl"

# -----------------------------------------------------------------------------
# Enable kdus
# -----------------------------------------------------------------------------

# FIXME [exiguous] Uncomment when kdbus will be available kernel side
# EXTRA_OECONF := "${@'${EXTRA_OECONF}'.replace('--disable-kdbus', '--enable-kdbus')}"
