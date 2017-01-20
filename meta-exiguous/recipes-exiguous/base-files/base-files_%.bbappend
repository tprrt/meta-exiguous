#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://motd \
            file://exiguous.fstab \
           "

hostname = "exiguous"

do_install_append() {

    # Merge exiguous.fstab to fstab (add or replace line)
    mount_used=$(cat ${D}${sysconfdir}/fstab|grep "^[^#]"|awk '{print $2}'|grep "^/")

    for current in $(cat ${WORKDIR}/exiguous.fstab|grep "^[^#]"); do
        mount_to=$(echo $current|awk '{print $2}')
        if [[ $mount_used == *$mount_to* ]] ; then
            sed -i "s/^$mount_to.*$/$current/g" ${D}${sysconfdir}/fstab
        else
            echo $current >> ${D}${sysconfdir}/fstab
        fi
    done

    # Update motd
    uname -snrvm >> ${D}${sysconfdir}/motd
}
