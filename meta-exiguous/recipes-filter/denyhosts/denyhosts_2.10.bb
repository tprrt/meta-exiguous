SUMMARRY = "Denyhosts provides SSH attack prevention"

DESCRIPTION = "DenyHosts is a script intended to be run by Linux system \
administrators to help thwart SSH server attacks (also known as dictionary \
based attacks and brute force attacks)."

HOMEPAGE = "https://github.com/denyhosts/denyhosts"

PV = "2.10"
SRC_URI = "https://github.com/denyhosts/denyhosts/archive/v${PV}.tar.gz"

SRC_URI[md5sum] = "43e818f5a3bf7f13d05461456a6a5788"
SRC_URI[sha256sum] = "2f519f39e8d00258ba0b6d4ce2a55501fdc08b52c5b5f8881c098b4460c89c26"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=baf1224d8a96e5f1a34e258dbd4cdca2"

SECTION = "security"

PR = "r0"

inherit setuptools
