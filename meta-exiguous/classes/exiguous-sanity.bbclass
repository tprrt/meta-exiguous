# Exiguous sanity check

def exiguous_machine_checker(d):
    supported_machines = ["qemux86-64",
                          "raspberrypi",
                          "beaglebone",
                          "tupi-desktop",
                          "tupi-htpc",
                          "tupi-nas",
                          "tupi-router",
                          "tupi-x220",
                          "ergo_1",
                          "ergo_2",
                          "heart_1"]
    current_machine = d.getVar("MACHINE", True)

    if not current_machine in supported_machines:
        bb.fatal("Exiguous distribution does not supported on %s" % (current_machine))

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
    flags["extra_all"] = d.getVar("EXIGUOUS_EXTRA_ALL", True)

    flags["features_ci"] = d.getVar("EXIGUOUS_FEATURES_CI", True)
    flags["features_htpc"] = d.getVar("EXIGUOUS_FEATURES_HTPC", True)
    flags["features_mediaserver"] = d.getVar("EXIGUOUS_FEATURES_MEDIASERVER", True)
    flags["features_nas"] = d.getVar("EXIGUOUS_FEATURES_NAS", True)
    flags["features_router"] = d.getVar("EXIGUOUS_FEATURES_ROUTER", True)
    flags["features_station"] = d.getVar("EXIGUOUS_FEATURES_STATION", True)

    flags["extra_debug_tools"] = d.getVar("EXIGUOUS_DEBUG_TOOLS", True)
    flags["extra_debug_symbols"] = d.getVar("EXIGUOUS_DEBUG_SYMBOLS", True)
    flags["extra_profiling_tools"] = d.getVar("EXIGUOUS_PROFILING_TOOLS", True)
    flags["extra_security_tools"] = d.getVar("EXIGUOUS_SECURITY_ANALYSIS_TOOLS", True)

    for key,value in flags.items():
        if not value in ["Yes", "No", None]:
           bb.fatal("Invalid Exiguous flag: %s = '%s'" % (key, value))

    if flags["debug"] is "Yes":
        bb.warn("Exiguous DEBUG configuration will be used")

    if flags["all"] is "Yes":
        if not flags["features_all"] is "Yes":
            bb.fatal("EXIGUOUS_FEATURES_ALL value should be 'Yes'")
        if not flags["extra_all"] is "Yes":
            bb.fatal("EXIGUOUS_EXTRA_ALL value should be 'Yes'")

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

    if flags["extra_all"] is "Yes":
        if not flags["extra_debug_tools"] is "Yes":
            bb.fatal("EXIGUOUS_DEBUG_TOOLS value should be 'Yes'")
        if not flags["extra_debug_symbols"] is "Yes":
            bb.fatal("EXIGUOUS_DEBUG_SYMBOLS value should be 'Yes'")
        if not flags["extra_profiling_tools"] is "Yes":
            bb.fatal("EXIGUOUS_PROFILING_TOOLS value should be 'Yes'")
        if not flags["security_analysis_tools"] is "Yes":
            bb.fatal("EXIGUOUS_SECURITY_ANALYSIS_TOOLS value should be 'Yes'")

def exiguous_image_checker(d):
    image = d.getVar("BUILD_IMAGES_FROM_FEEDS", True)
    if not image is None and not "exiguous-" in image:
        bb.fatal("Exiguous distribution is not compatible with %s" % (image))

python __anonymous() {
    exiguous_bblayer_checker(d)
    exiguous_machine_checker(d)
    exiguous_flags_checker(d)
    exiguous_image_checker(d)
}
