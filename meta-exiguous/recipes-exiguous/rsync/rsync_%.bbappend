BBCLASSEXTEND = "native"

# We need the fake-super option, which requires the xattr support
#
# For runtime rsync this is to required since the fake-super is
# passed to the remote rsync
#
EXTRA_OECONF_append_class-native = " --enable-xattr-support"
