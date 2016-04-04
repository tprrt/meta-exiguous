# These two patchs will do bizarre things (python compile but no C extension like _ssl)
# There is clearly an environment variables between those which are in the Makefile and those which are read by setup.py
SRC_URI_remove = "file://python3-use-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch \
		  file://python3-setup.py-no-host-headers-libs.patch \
		 "

TARGET_CC_ARCH_remove_armv6 = "${@bb.utils.contains("TUNE_FEATURES", 'vfp', '-D__SOFTFP__', '', d)}"
TARGET_CC_ARCH_remove_armv7a = "${@bb.utils.contains("TUNE_FEATURES", 'vfp', '-D__SOFTFP__', '', d)}"
