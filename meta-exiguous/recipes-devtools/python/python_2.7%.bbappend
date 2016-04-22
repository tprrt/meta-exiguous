TARGET_CC_ARCH_remove_armv6 = "${@bb.utils.contains("TUNE_FEATURES", 'vfp', '-D__SOFTFP__', '', d)}"
TARGET_CC_ARCH_remove_armv7a = "${@bb.utils.contains("TUNE_FEATURES", 'vfp', '-D__SOFTFP__', '', d)}"
