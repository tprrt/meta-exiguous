FILESEXTRAPATHS_prepend := "${THISDIR}/linux-exiguous:"

LINUX_VERSION_EXTENSION ?= "-exiguous-${LINUX_KERNEL_TYPE}"

SRC_URI += "file://security.cfg \
            file://scripts.cfg \
            file://loop.cfg \
            file://netconsole.cfg \
	    file://earlyprintk.cfg \
	    file://kdump.cfg \
	    \
	    ${@bb.utils.contains("EXIGUOUS_DEBUG", "Yes", "file://debug.cfg", "", d)} \
           "

# FIXME [exiguous] kernel SERIAL_CONSOLE configuration
# FIXME [exiguous] kernel CMDLINE configuration (loglevel, earlyprintk....)
# FIXME [exiguous] kernel CMDLINE_DEBUG  (loglevel, earlyprintk, crashkernel....)
# FIXME [exiguous] kernel APPEND (netconsole...)

# NB: APPEND being the name of the variable that is passed to the kernel by the
# boot loader.

# kdump
# APPEND += "maxcpus=1 reset_devices crashkernel=512M-2G:64M,2G-:128M"
# APPEND_(i386|x86_64|ia64) += "irqpoll"

# netconsole
# TUPI_NETCONSOLE_PORT ?= "6666"
# TUPI_NETCONSOLE_IP ?= "192.168.0.10"
# TUPI_NETCONSOLE_DEVICE ?= "eth0"
# APPEND += "netconsole=${TUPI_NETCONSOLE_PORT}@${TUPI_NETCONSOLE_IP}/${TUPI_NETCONSOLE_DEVICE},${TUPI_NETCONSOLE_PORT}@${TUPI_NETCONSOLE_IP}/${TUPI_NETCONSOLE_DEVICE}"

# do_kernel_configme_append() {
#     sed -i -e "s|^CONFIG_CMDLINE=.*$|CONFIG_CMDLINE=\"${CMDLINE}\"|" ${KBUILD_OUTPUT}/.config
# }
