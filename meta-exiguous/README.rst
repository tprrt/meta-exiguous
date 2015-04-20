..
.. -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

This README file contains information on the contents of the
Exiguous layer.

Please see the corresponding sections below for details.

Dependencies
============

This layer depends on:

 - openembedded-core
   URI: git://git.openembedded.org/openembedded-core
   branch: master
   revision: HEAD
   prio: default

 - meta-yocto
   URI: git://git.yoctoproject.org/meta-yocto
   layers: meta-yocto, meta-yocto-bsp
   branch: master
   revision: HEAD
   prio: default

 - meta-selinux
   URI: git://git.yoctoproject.org/meta-selinux
   branch: master
   revision: HEAD
   prio: default

 - meta-oe
   URI: git://git.openembedded.org/meta-openembedded
   layers: meta-oe
   branch: master
   revision: HEAD
   prio: default

 - meta-musl
   URI: git://git@github.com:kraj/meta-musl.git
   branch: master
   revision: HEAD
   prio: default

 .. - meta-ros
 ..   URI: TODO
 ..   layers: TODO 
 ..   branch: master
 ..   revision: HEAD

Distro features
===============

 - kernel v3.14 LTS
 - sysvinit is replaced by systemd
 - busybox is replaced by toybox
 - RPM packages manager is replaced by Debian packages manager
 - Enable some features by default: ipv6, iptables, selinux, avahi, nfs...

Image features
===============

 - read-only root filesystem
 - openssh is replaced by dropbear
 - Enable hardware codecs by default
 - Enable NFS server by default
 - Enable SELinux by default

.. Package group features
.. ======================

..  - Common features
..   - Linux kernel v3.14 LTS

  .. - toybox
  .. - pam
  .. - systemd

  .. - ipv6

  .. - prelink
  .. - preload
  .. - zram-config

  .. - fail2ban
  .. - denyhost

  .. - Freelan (VPN)

  .. - nfs share
  .. - samba share
  .. - sync home folded

  .. - LUKS
  .. - LXC

  .. - Embedded features
  .. - serial console
  .. - ro root + overlayFS

 .. - Real time features
 ..  - Linux kernel v3.14 preempt-rt

 .. - Proxies features
 ..  - Reverse proxy (Varnish)
 ..  - Cache proxy (Nginx)

 .. - Router features
 ..  - DNS
 ..  - DHCP
 ..  - Freelan server

 .. - Sabnzbd features
 ..  - TODO

 .. - CI features
 ..  - git
 ..  - devtools
 ..   - TODO
 ..  - Buildbot
 ..  - TODO

 .. - NAS features
 ..  - TODO

 .. - HTPC features
 ..  - TODO

 .. - Desktop features
 ..  - packages management debian

 .. - Laptop features
 ..  - TODO

 .. - ROS features
 ..  - ROSc
 ..  - TODO

Supported machine
=================

 - Qemu-(x86-64|arm|arm64|mips|ppc)
 - generic-x86-64
 - Raspberry Pi rev. B
 - BeagleBone Black rev. B

Contributing
============

The main communication tool we use is a mailing list:
    yocto@yoctoproject.org
    https://lists.yoctoproject.org/listinfo/yocto

Feel free to ask any kind of questions but always prepend your email subject
with "[meta-exiguous]". This is because we use the 'yocto' mailing list and
not a perticular 'meta-exiguous' mailing list.

To contribute to this layer you should send the patches for review to the
above specified mailing list.
The patches should be compliant with the openembedded patch guidelines:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

To send changes to mailing list use something like:

::

    $ git send-email --to yocto@yoctoproject.org \
          --subject-prefix='meta-exiguous][PATCH'


Adding the Exiguous layer to your build
=======================================

In order to use this layer, you need to make the build system aware of
it.

Assuming the Exiguous layer exists at the top-level of your
OE build tree, you can add it to the build system by adding the
location of the Exiguous layer to bblayers.conf, along with any
other layers needed. e.g.:

  BBLAYERS ?= " \
    /path/to/yocto/meta \
    /path/to/yocto/meta-yocto \
    /path/to/yocto/meta-yocto-bsp \
    /path/to/yocto/meta-selinux \
    /path/to/yocto/meta-musl \
    /path/to/yocto/meta-exiguous \
    "
