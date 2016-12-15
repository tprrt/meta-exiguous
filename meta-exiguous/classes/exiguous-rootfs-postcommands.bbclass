#
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

# Compile embedded Python3 with optimization flag
# -----------------------------------------------------------------------------

inherit python3native

do_rootfs[depends] += "python3-native:do_populate_sysroot"

compile_python3_sources() {
	pyfiles=$(find ${IMAGE_ROOTFS} -name "*.py")

	for pyfile in ${pyfiles} ; do
	        # Compile python with optimization flag
		python3 -OO -m compileall -lq ${pyfile} || bbwarn "Unable to compile '${pyfile}'"
	done

	# Remove python compiled without optimization flag
	pycfiles=$(find ${IMAGE_ROOTFS} -name "*.pyc")
	for pycfile in ${pycfiles} ; do
		rm -f ${pycfile}
	done
}

ROOTFS_POSTPROCESS_COMMAND += "compile_python3_sources ; "

# FIXME [exiguous] Re-enable read-only-rootfs
