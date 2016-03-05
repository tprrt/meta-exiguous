#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

# Exiguous sanity check

def exiguous_bblayer_checker(d):
    bblayers = d.getVar("BBLAYERS", True).split()

    for layer in bblayers:
        if bblayers.count(layer) > 1:
            bb.fatal("Exiguous distribution contains duplicate layers: %s" % (layer))

def exiguous_flags_checker(d):

    flags = {}

    flags["debug"] = d.getVar("EXIGUOUS_DEBUG", True)

    flags["all"] = d.getVar("EXIGUOUS_ALL", True)
    flags["features_all"] = d.getVar("EXIGUOUS_FEATURES_ALL", True)

    flags["features_ci"] = d.getVar("EXIGUOUS_FEATURES_CI", True)
    flags["features_htpc"] = d.getVar("EXIGUOUS_FEATURES_HTPC", True)
    flags["features_mediaserver"] = d.getVar("EXIGUOUS_FEATURES_MEDIASERVER", True)
    flags["features_nas"] = d.getVar("EXIGUOUS_FEATURES_NAS", True)
    flags["features_router"] = d.getVar("EXIGUOUS_FEATURES_ROUTER", True)
    flags["features_station"] = d.getVar("EXIGUOUS_FEATURES_STATION", True)

    for key,value in flags.items():
        if not value in ["Yes", "No", None]:
           bb.fatal("Invalid Exiguous flag: %s = '%s'" % (key, value))

    if flags["debug"] is "Yes":
        bb.warn("Exiguous DEBUG configuration will be used")

    if flags["all"] is "Yes":
        if not flags["features_all"] is "Yes":
            bb.fatal("EXIGUOUS_FEATURES_ALL value should be 'Yes'")

    if flags["features_all"] is "Yes":
        if not flags["features_ci"] is "Yes":
            bb.fatal("EXIGUOUS_FEATURES_CI value should be 'Yes'")
        if not flags["features_htpc"] is "Yes":
            bb.fatal("EXIGUOUS_FEATURES_HTPC value should be 'Yes'")
        if not flags["features_mediaserver"] is "Yes":
            bb.fatal("EXIGUOUS_FEATURES_MEDIASERVER value should be 'Yes'")
        if not flags["features_nas"] is "Yes":
            bb.fatal("EXIGUOUS_FEATURES_NAS value should be 'Yes'")
        if not flags["features_router"] is "Yes":
            bb.fatal("EXIGUOUS_FEATURES_ROUTER value should be 'Yes'")
        if not flags["features_station"] is "Yes":
            bb.fatal("EXIGUOUS_FEATURES_STATION value should be 'Yes'")

def exiguous_tclibc_checker(d):
    tclibc = d.getVar("TCLIBC", True)
    if not tclibc == "musl":
        bb.fatal("The primary toolchain of Exiguous should use 'musl' instead of '%s'" % (tclibc))

def exiguous_distro_name_checker(d):
    distro = d.getVar("DISTRO", True)
    distro_name = d.getVar("DISTRO_NAME", True)

    if not distro == "exiguous":
        bb.fatal("'DISTRO' should be set to 'exiguous' instead of '%s'" % (distro))

    if not distro_name == "Exiguous powered by OpenEmbedded/Yocto":
        bb.fatal("'DISTRO_NAME' should be set to 'Exiguous powered by OpenEmbedded/Yocto' instead of '%s'" % (distro_name))

# FIXME Implement sanity check to verify distro's version
# def exiguous_distro_version_checker(d):
#     raise NotImplementedError

# FIXME Implement sanity check to verify distro's features
# def exiguous_distro_features_checker(d):
#     raise NotImplementedError

def exiguous_image_name_checker(d):
    # img_basename = d.getVar("IMAGE_BASENAME", True)
    #     if not "exiguous-image" in img_basename:
    #         bb.fatal("Invalid Exiguous image: IMAGE_BASENAME = '%s'" % (img_basename))

    # img_name = d.getVar("IMAGE_NAME", True)
    #     if not "exiguous-image" in img_name:
    #         bb.fatal("Invalid Exiguous image: IMAGE_NAME = '%s'" % (img_name))

    current_linguas = d.getVar("IMAGE_LINGUAS", True)
    if not current_linguas == "":
        bb.fatal("'IMAGE_LINGUAS' should be set to '' instead of '%s'" % (current_linguas))

    current_extra = d.getVar("EXTRA_IMAGE_FEATURES", True)
    if not current_extra == "":
        bb.fatal("'EXTRA_IMAGE_FEATURES' should be set to '' instead of '%s'" % (current_extra))

def exiguous_machine_checker(d):
    supported_machines = ["qemu-exiguous",
                          "raspberrypi",
                          "raspberrypi2",
                          "beaglebone",
                          "qemu-exiguous",
                          "tupi-desktop",
                          "tupi-htpc",
                          "tupi-nas",
                          "tupi-router",
                          "tupi-x220",
                          "ergo-rpi",
                          "ergo-bbb",
                          "heart"]
    current_machine = d.getVar("MACHINE", True)

    if not current_machine in supported_machines:
        bb.fatal("Exiguous distribution does not supported on %s" % (current_machine))

# FIXME Implement sanity check to verify machine's features
# def exiguous_machine_features_checker(d):
#     raise NotImplementedError

# FIXME Implement sanity check to verify the kernel configuration
# def exiguous_kernel_checker(d):
#     raise NotImplementedError

# To run Exiguous's sanity checks only if OE's sanity checks have been passed
addhandler exiguous_checker
exiguous_checker[eventmask] = "bb.event.SanityCheckPassed bb.event.NetworkTestPassed"

python exiguous_checker() {
    ename = bb.event.getName(e)
    if ename == "SanityCheckPassed" or ename == "NetworkTestPassed":
        d = copy_data(e)

        exiguous_bblayer_checker(d)

        exiguous_flags_checker(d)
        exiguous_tclibc_checker(d)

        exiguous_distro_name_checker(d)
        # exiguous_distro_version_checker(d)
        # exiguous_distro_features_checker(d)

        exiguous_image_name_checker(d)
        # exiguous_image_features_checker(d)

        exiguous_machine_checker(d)
        # exiguous_machine_features_checker(d)

        # exiguous_kernel_checker(d)

    return
}
