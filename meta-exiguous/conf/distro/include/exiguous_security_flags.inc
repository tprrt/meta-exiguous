
# To fix a build issue on krb5
SECURITY_CFLAGS_pn-krb5 = "${SECURITY_NO_PIE_CFLAGS}"

# To fix a build issue on preload
SECURITY_CFLAGS_pn-preload += "-Wno-error=unused-result"
