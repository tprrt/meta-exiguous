do_install_append() {
    echo "# Keep file empty to disable root logins at the console" > ${D}${sysconfdir}/securetty
}
