SUMMARY = "Exiguous image init script"
DESCRIPTION = "Init script used to bootstrap Exgiguous, using kexec, makedumpfile..."
AUTHOR = "Thomas Perrot <thomas.perrot@tupi.fr>"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI = "file://init-exiguous.sh"

PR = "r0"

inherit allarch

S = "${WORKDIR}"

# FIXME [exiguous] Replace all tools of initramfs by busybox or a version
# statically linked with klibc to reduce its size.

# FIXME [exiguous] Re-enable crypto in initramfs

# FIXME [exiguous] bash is a required depend of lvm2 !?

# FIXME [exiguous] Enable mdadm only if software RAID is used by the machine target

# RDEPENDS_${PN} = "busybox kexec makedumpfile udev mdadm cryptsetup lvm2"
RDEPENDS_${PN} = "busybox kexec makedumpfile"

do_install() {
    install -m 0755 ${WORKDIR}/init-exiguous.sh ${D}/init

    # Create device nodes expected by some kernels in initramfs
    # before even executing /init.
    install -d ${D}/dev
    mknod -m 622 ${D}/dev/console c 5 1
}

FILES_${PN} = "/init /dev"
