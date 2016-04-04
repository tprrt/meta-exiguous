pkg_postinst_prelink() {
#!/bin/sh

if [ "x$D" != "x" ]; then
  ${@bb.utils.contains('USER_CLASSES', 'image-prelink', 'exit 0', 'exit 1', d)}
fi

prelink -amR
}
