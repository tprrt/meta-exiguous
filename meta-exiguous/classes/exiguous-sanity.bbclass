#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

# Exiguous sanity check

def exiguous_bblayer_checker(d):
    bblayers = d.getVar("BBLAYERS", True).split()

    for layer in bblayers:
        if bblayers.count(layer) > 1:
            bb.fatal("Exiguous distribution contains duplicate layers: %s" % (layer))

def exiguous_tclibc_checker(d):
    tclibc = d.getVar("TCLIBC", True)
    if not tclibc == "glibc":
        bb.fatal("The primary toolchain of Exiguous should use 'glibc' instead of '%s'" % (tclibc))

def exiguous_distro_name_checker(d):
    distro = d.getVar("DISTRO", True)
    distro_name = d.getVar("DISTRO_NAME", True)

    if not distro == "exiguous":
        bb.fatal("'DISTRO' should be set to 'exiguous' instead of '%s'" % (distro))

    if not distro_name == "Exiguous powered by OpenEmbedded/Yocto":
        bb.fatal("'DISTRO_NAME' should be set to 'Exiguous powered by OpenEmbedded/Yocto' instead of '%s'" % (distro_name))

# FIXME [exiguous] Implement sanity check to verify distro's version
def exiguous_distro_version_checker(d):
    from re import compile

    regexp = compile("???? # FIXME ?????")
    version = d.getVar("DISTRO_VERSION", True)
    if version is None:
        bb.fatal("Undefined runtime's version")
    elif regexp.match(version) is None:
        bb.fatal("Malformed runtime's version: '%s'" % (version))

# FIXME [exiguous] Implement sanity check to verify distro's features
# def exiguous_distro_features_checker(d):
#     raise NotImplementedError

def exiguous_image_name_checker(d):
    image = d.getVar("BUILD_IMAGES_FROM_FEEDS", True)
    if not image is None and not "exiguous-" in image:
        bb.fatal("Exiguous is not compatible with %s" % (image))

def exiguous_image_features_checker(d):
    current_linguas = d.getVar("IMAGE_LINGUAS", True)
    if not current_linguas == "en-us en-gb":
        bb.fatal("'IMAGE_LINGUAS' should be set to '' instead of '%s'" % (current_linguas))

    current_extra = d.getVar("EXTRA_IMAGE_FEATURES", True)
    if not current_extra == "":
        bb.fatal("'EXTRA_IMAGE_FEATURES' should be set to '' instead of '%s'" % (current_extra))

def exiguous_machine_checker(d):
    supported_machines = ["qemu-exiguous",
                          "tupi-desktop",
                          "tupi-htpc-rpi2",
                          "tupi-nas",
                          "tupi-router",
                          "tupi-x220",
                          "ergo-rpi",
                          "ergo-bbb",
                          "heart-rpi"]
    current_machine = d.getVar("MACHINE", True)

    if not current_machine in supported_machines:
        bb.fatal("Exiguous distribution does not supported on %s" % (current_machine))

# FIXME [exiguous] Implement sanity check to verify machine's features

# FIXME [exiguous] Update kernel checker to fix issue with rpi and bbb
def exiguous_kernel_checker(d):

    kernel = {}
    kernel["name"] = "linux-stable"
    kernel["version"] = "4.7%"
    kernel["initramfs"] = "cpio.lz4"
    # kernel["header"] = "4.7"

    current = {}
    current["name"] = d.getVar("PREFERRED_PROVIDER_virtual/kernel", True) or ""
    current["version"] = d.getVar("PREFERRED_VERSION_%s" % (current["name"]), True) or ""
    current["initramfs"] = d.getVar("INITRAMFS_FSTYPES", True) or ""
    # current["header"] = d.getVar("LINUXLIBCVERSION", True) or ""

    diffs = [ key for key in kernel if not kernel[key] in current[key] ]

    for diff in diffs:
        bb.fatal("A kernel requirement is not met: '%s' has '%s' expected '%s'" % (diff, current[diff], kernel[diff]))

# To run Exiguous's sanity checks only if OE's sanity checks have been passed
addhandler exiguous_checker
exiguous_checker[eventmask] = "bb.event.SanityCheckPassed bb.event.NetworkTestPassed"

python exiguous_checker() {
    ename = bb.event.getName(e)
    if ename == "SanityCheckPassed" or ename == "NetworkTestPassed":
        d = copy_data(e)

        exiguous_bblayer_checker(d)

        exiguous_tclibc_checker(d)

        exiguous_distro_name_checker(d)
        # exiguous_distro_version_checker(d)
        # exiguous_distro_features_checker(d)

        exiguous_image_name_checker(d)
        exiguous_image_features_checker(d)

        exiguous_machine_checker(d)
        # exiguous_machine_features_checker(d)

        exiguous_kernel_checker(d)

    return
}
