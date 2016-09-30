# FIXME [exiguous] Fix to build u-boot for x86-64 target
INHIBIT_DEFAULT_DEPS_x86-64 = "1"
DEPENDS_x86-64 = "libgcc virtual/${TARGET_PREFIX}gcc"

python __anonymous () {
    multi = bb.data.getVar("MULTILIB_VARIANTS", d, 1)
    tunes = bb.data.getVar("TUNE_FEATURES", d, 1)

    if "m64" in tunes and "corei7" in tunes:
        if not "lib32" in multi:
            raise bb.parse.SkipPackage("Building the u-boot for 'x86-64 64bits' requires multilib 'lib32' to be enabled")

            sys_multilib = 'i686' + d.getVar('TARGET_VENDOR', False) + 'mllib32-' + d.getVar('HOST_OS', False)
            d.setVar('DEPENDS_append', ' lib32-gcc-cross-i686 lib32-libgcc')
            d.setVar('PATH_append', ':' + d.getVar('STAGING_BINDIR_NATIVE', False) + '/' + sys_multilib)
            d.setVar('TOOLCHAIN_OPTIONS_append', '/../lib32-' + d.getVar("MACHINE", False))
            d.setVar("WRAP_TARGET_PREFIX", sys_multilib + '-')
}

WRAP_TARGET_PREFIX_x86-64 ?= "${TARGET_PREFIX}"
EXTRA_OEMAKE_x86-64 = 'CROSS_COMPILE=${WRAP_TARGET_PREFIX} CC="${WRAP_TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
EXTRA_OEMAKE_x86-64 += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
