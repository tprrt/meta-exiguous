SUMMARY = "Merge machine and distro options to create a basic machine task/package"

LICENSE = "GPLv2"

PR = "r0"

inherit packagegroup

PROVIDES = "${PACKAGES}"

PACKAGES = " \
    ${PN}-core \
    ${PN}-core-bootloader \
    ${PN}-core-kernel \
    ${PN}-core-system \
    ${PN}-core-optimization \
    ${PN}-core-network \
    ${PN}-core-security \
    \
    ${PN}-extra \
    ${PN}-extra-debug-tools \
    ${PN}-extra-debug-symbols \
    ${PN}-extra-profiling \
    ${PN}-extra-tests \
    ${PN}-extra-security-analysis \
    \
    ${PN}-features \
    ${PN}-features-station \
    ${PN}-features-router \
    ${PN}-features-nas \
    ${PN}-features-mediaserver \
    ${PN}-features-htpc \
    ${PN}-features-ci \
    "

# -----------------------------------------------------------------------------
# Exiguous core packages
# -----------------------------------------------------------------------------

SUMMARY_${PN}-core = "Exiguous core packages"
RDEPENDS_${PN}-core = " \
    packagegroup-core-boot \
    \
    ${PN}-core-bootloader \
    ${PN}-core-kernel \
    ${PN}-core-system \
    ${PN}-core-optimization \
    ${PN}-core-network \
    ${PN}-core-security \
    "

SUMMARY_${PN}-core-bootloader = "Exiguous core bootloader package"
RDEPENDS_${PN}-core-bootloader = "virtual/bootloader"

SUMMARY_${PN}-core-kernel = "Exiguous core kernel package"
RDEPENDS_${PN}-core-kernel = "kernel-modules"
RRECOMMENDS_${PN}-core-kernel = "virtual/kernel kernel-module-af-packet"

SUMMARY_${PN}-core-system = "Exiguous core system package"
RDEPENDS_${PN}-core-system = " \
    acl xattr pam largefile tzdata useradd extrausers \
    toybox systemd cronie ntp udev dbus udisks sysklogd cryptsetup \
    packagegroup-core-ssh-dropbear \
    rsync bash bash-completion pigz \
    pm-utils acpid lxc \
    "

# FIXME [exiguous] Enable zram only if swap is enabled

SUMMARY_${PN}-core-optimization = "Exiguous core optimization package"
RDEPENDS_${PN}-core-optimization = " \
    prelink \
    zram \
    ls-is-gold \
    "

SUMMARY_${PN}-core-network = "Exiguous core network package"
RDEPENDS_${PN}-core-network = " \
    ipv6 iptables avahi nfs samba \
    "

SUMMARY_${PN}-core-security = "Exiguous core security package"
RDEPENDS_${PN}-core-security = " \
    audit \
    selinux \
    "

# -----------------------------------------------------------------------------
# Exiguous extra packages
# -----------------------------------------------------------------------------

SUMMARY_${PN}-extra = "Exiguous extra packages"
RDEPENDS_${PN}-extra = " \
    ${PN}-extra-debug-tools \
    ${PN}-extra-debug-symbol \
    ${PN}-extra-tests \
    ${PN}-extra-profiling \
    ${PN}-extra-security-analysis \
    \
    ${PN}-extra-station \
    ${PN}-extra-router \
    ${PN}-extra-nas \
    ${PN}-extra-mediaserver \
    ${PN}-extra-htpc \
    ${PN}-extra-ci \
    "
ALLOW_EMPTY_${PN}-extra = "1"

SUMMARY_${PN}-extra-debug = "Exiguous extra debug package"
RDEPENDS_${PN}-extra-debug = " \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "kexec-tools", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "crash", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "gdbserver", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "gdb", "", d)} \
    "
ALLOW_EMPTY_${PN}-extra-debug = "1"

# FIXME [exiguous] Enable Exiguous debug symbols package
SUMMARY_${PN}-extra-debug-symbols = "Exiguous extra debug symbols package"
RDEPENDS_${PN}-extra-debug-symbols = ""
ALLOW_EMPTY_${PN}-extra-debug-symbols = "1"

# FIXME [exiguous] Enable Exiguous tests package
SUMMARY_${PN}-extra-tests = "Exiguous extra tests package"
RDEPENDS_${PN}-extra-tests = ""
ALLOW_EMPTY_${PN}-extra-tests = "1"

SUMMARY_${PN}-extra-profiling = "Exiguous extra profiling package"
RDEPENDS_${PN}-extra-profiling = " \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "strace", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "ltrace", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "perf", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "oprofile", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "valgrind", "", d)} \
    "
ALLOW_EMPTY_${PN}-extra-profiling = "1"

SUMMARY_${PN}-extra-security-analysis = "Exiguous extra security analysis package"
RDEPENDS_${PN}-extra-security-analysis = " \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "checksec", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "nmap", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "nikto", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "checksecurity", "", d)} \
    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "buck-security", "", d)} \
    "
ALLOW_EMPTY_${PN}-extra-security = "1"

# -----------------------------------------------------------------------------
# Exiguous additional features packages
# -----------------------------------------------------------------------------

SUMMARY_${PN}-features = "Exiguous features packages"
RDEPENDS_${PN}-features = " \
    ${PN}-features-station \
    ${PN}-features-router \
    ${PN}-features-nas \
    ${PN}-features-mediaserver \
    ${PN}-features-htpc \
    ${PN}-features-ci \
    "
ALLOW_EMPTY_${PN}-features = "1"

# FIXME [exiguous] Enable ${PN}-features-station
SUMMARY_${PN}-features-station = "Exiguous extra station package"
RDEPENDS_${PN}-features-station = ""
ALLOW_EMPTY_${PN}-features-station = "1"

# FIXME [exiguous] Enable ${PN}-features-router
SUMMARY_${PN}-features-router = "Exiguous extra router package"
RDEPENDS_${PN}-features-router = ""
ALLOW_EMPTY_${PN}-features-router= "1"

# FIXME [exiguous] Enable ${PN}-features-nas
SUMMARY_${PN}-features-nas = "Exiguous extra nas package"
RDEPENDS_${PN}-features-nas = ""
ALLOW_EMPTY_${PN}-features-nas = "1"

# FIXME [exiguous] Enable ${PN}-features-mediaserver
SUMMARY_${PN}-features-mediaserver = "Exiguous extra mediaserver package"
RDEPENDS_${PN}-features-mediaserver = ""
ALLOW_EMPTY_${PN}-features-mediaserver = "1"

# FIXME [exiguous] Enable ${PN}-features-htpc
SUMMARY_${PN}-features-htpc = "Exiguous extra htpc package"
RDEPENDS_${PN}-features-htpc = ""
ALLOW_EMPTY_${PN}-features-htpc = "1"

# FIXME [exiguous] Enable ${PN}-features-ci
SUMMARY_${PN}-features-ci = "Exiguous extra ci package"
RDEPENDS_${PN}-features-ci = ""
ALLOW_EMPTY_${PN}-features-ci = "1"
