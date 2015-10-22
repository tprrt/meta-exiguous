#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

AUTHOR = "Thomas Perrot <thomas.perrot@tupi.fr>"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://exiguous.sysctl.conf"

do_install_append() {

    # Merge exiguous.sysctl.conf to sysctl.conf (add or replace line)
    conf_used=$(cat ${D}${sysconfdir}/sysctl.conf|grep "^[^#]"|cut -d"=" -f1)

    for current in $(cat ${WORKDIR}/exiguous.sysctl.conf|grep "^[^#]") ; do
        conf_to=$(echo $current|cut -d"=" -f1)
        if [[ $conf_used == *$conf_to* ]] ; then
            sed -i "s/^$conf_to.*$/$current/" ${D}${sysconfdir}/sysctl.conf
        else
            echo $current >> ${D}${sysconfdir}/sysctl.conf
        fi
    done
}