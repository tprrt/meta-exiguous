AUTHOR = "Thomas Perrot <thomas.perrot@tupi.fr>"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://motd \
            file://exiguous.fstab \
           "

do_install_append() {

    # Merge exiguous.fstab to fstab (add or replace line)
    mount_used=$(cat ${D}${sysconfdir}/fstab|grep "^[^#]"|awk '{print $2}'|grep "^/")

    for current in $(cat ${WORKDIR}/exiguous.fstab|grep "^[^#]"); do
        mount_to=$(echo $current|awk '{print $2}')
        if [[ $mount_used == *$mount_to* ]] ; then
            sed -i "s/^$mount_to.*$/$current/" ${D}${sysconfdir}/fstab
        else
            echo $current >> ${D}${sysconfdir}/fstab
        fi
    done

    # Update motd
    uname -snrvm >> ${D}${sysconfdir}/motd
}
