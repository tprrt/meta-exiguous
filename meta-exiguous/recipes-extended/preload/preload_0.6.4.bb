SUMMARY = "preload is an adaptive readahead daemon."

DESCRIPTION = "preload is an adaptive readahead daemon. It monitors \
applications that users run, and by analyzing this data, predicts \
what applications users might run, and fetches those binaries and \
their dependencies into memory for faster startup times."

HOMEPAGE = "http://sourceforge.net/projects/preload"

PV = "0.6.4"
MOD_PV = "127"
SRC_URI = "svn://svn.code.sf.net/p/preload/code;module=trunk;rev=${MOD_PV}"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"

SECTION = "base"

DEPENDS = "glib-2.0 help2man-native"

RDEPENDS_${PN} = "bash lsb"

PR = "r0"

S = "${WORKDIR}/trunk"

inherit autotools-brokensep pkgconfig update-rc.d

PARALLEL_MAKE = ""

INITSCRIPT_PACKAGES = "${PN}"
INITSCRIPT_NAME_${PN} = "preload"
INITSCRIPT_PARAMS_${PN} = "defaults"

