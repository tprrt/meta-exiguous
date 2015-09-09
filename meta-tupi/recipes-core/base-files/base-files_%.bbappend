FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://desktop.fstab \
            file://nas.fstab \
            file://x220.fstab \
           "

do_install_append() {

    # Merge ${MACHINE}.fstab to fstab (add or replace line)
    if [ -f ${WORKDIR}/${MACHINE}.fstab ]; then
        mount_used=$(cat ${D}${sysconfdir}/fstab|awk '{print $2}'|grep "^/")

    	for current in $(cat ${WORKDIR}/exiguous.fstab); do
            mount_to=$(echo $current|awk '{print $2}')
	    if [[ $mount_used == *$mount_to* ]]; then
	        sed -i "s/^$mount_to.*$/$current/" ${D}${sysconfdir}/fstab
	    else
	        echo $current >> ${D}${sysconfdir}/fstab
	    fi
    	done
    fi
}
