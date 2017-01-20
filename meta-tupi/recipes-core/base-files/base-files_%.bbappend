#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://tupi-desktop-z77.fstab \
            file://tupi-nas-b75m.fstab \
            file://tupi-laptop-x220.fstab \
           "

do_install_append() {

    # Merge ${MACHINE}.fstab to fstab (add or replace line)
    if [ -f ${WORKDIR}/${MACHINE}.fstab ]; then
        mount_used=$(cat ${D}${sysconfdir}/fstab|grep "^[^#]"|awk '{print $2}'|grep "^/")

        for current in $(cat ${WORKDIR}/exiguous.fstab|grep "^[^#]"); do
            mount_to=$(echo $current|awk '{print $2}')
            if [[ $mount_used == *$mount_to* ]]; then
                sed -i "s/^$mount_to.*$/$current/g" ${D}${sysconfdir}/fstab
            else
                echo $current >> ${D}${sysconfdir}/fstab
            fi
        done
    fi
}
