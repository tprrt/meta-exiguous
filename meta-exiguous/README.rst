..
.. -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

This README file contains information on the contents of the
Exiguous layer.

Please see the corresponding sections below for details.

============
Dependencies
============

This layer depends on:

:openembedded-core:
 - URI: git://git.openembedded.org/openembedded-core
 - branch: master
 - revision: HEAD
 - prio: default

:meta-yocto:
 - URI: git://git.yoctoproject.org/meta-yocto
 - layers: meta-yocto, meta-yocto-bsp
 - branch: master
 - revision: HEAD
 - prio: default

:meta-oe:
 - URI: git://git.openembedded.org/meta-openembedded
 - layers: meta-oe, meta-networking, meta-python
 - branch: master
 - revision: HEAD
 - prio: default

:meta-selinux:
 - URI: git://git.yoctoproject.org/meta-selinux
 - branch: master
 - revision: HEAD
 - prio: default

.. :meta-musl:
..  - URI: git://git@github.com:kraj/meta-musl.git
..  - branch: master
..  - revision: HEAD
..  - prio: default

.. :meta-ros:
..  - URI: TODO
..  - layers: TODO 
..  - branch: master
..  - revision: HEAD

===============
Distro features
===============

- kernel Linux v3.14 LTSI
- Sysvinit is replaced by Systemd
- Busybox is replaced by Toybox
- RPM packages manager is replaced by Debian packages manager
- Enable some features by default: ipv6, iptables, selinux, avahi, nfs...

---------------
Common features
---------------

System
~~~~~~

- E kernel Linux v3.14  openembedded-core
- E hwcodecs            openembedded-core               IMAGES_FEATURES
- E cryptsetup          meta-oe
- E read-only-rootfs    openembedded-core               IMAGES_FEATURES
- D overlayFS           meta-hipos
- E systemd             meta-systemd
- E udev                openembedded-core
- E toybox              meta-oe
- E dbus                openembedded-core
- E udisks              meta-oe
- E ntp                 openembedded-core
- E cronie              openembedded-core
- E pm-utils            openembedded-core
- E sysklogd            openembedded-core
- D powerd              meta-webos
- D lxc                 meta-virtualization
- E ipv6                openembedded-core
- E tzdata              openembedded-core
- E acl                 openembedded-core
- E xattr               openembedded-core
- E pam                 openembedded-core
- E largefile           openembedded-core
- E useradd             openembedded-core
- E extrausers          openembedded-core
- E usbhost             openembedded-core
- E usbutils            openembedded-core
- E usbgadget           openembedded-core

Optimizations
~~~~~~~~~~~~~

- E prelink             openembedded-core
- D preload		meta-exiguous
- E zram                meta-oe

Security
~~~~~~~~

- E selinux             meta-selinux                  IMAGE_INSTALL
- E iptables            openembedded-core
- D fail2ban            meta-exiguous
- D denyhost            meta-exiguous
- D checksecurity       meta-security
- D nikto               meta-security
- D nmap                meta-security

Network
~~~~~~~

- D ipxe                meta-virtualization
- E nfs                 openembedded-core             IMAGE_FEATURES
- E dropbear            openembedded-core             IMAGE_INSTALL
- E samba               meta-oe
- E avahi               openembedded-core
- D freelan (VPN)       meta-exiguous

Backup/Sync
~~~~~~~~~~~

- D rsync               openembedded-core
- D unison              meta-exiguous

Tests
~~~~~

- D ptests              openembedded-core             IMAGE_INSTALL
- D ptest-runner        openembedded-core
- D pm-qa               meta-oe

--------------------------------
Additional features for stations
--------------------------------

- D sudo                openembedded-core
- D package-management  openembedded-core             IMAGE_FEATURES
- D waylan              openembedded-core
- D xfdesktop           meta-xfce
- ...

---------------------------------------------------------------------
Additional features for Router/Bridge/Firewall/DNS/Proxy/ReverseProxy
---------------------------------------------------------------------

Router Freelan
~~~~~~~~~~~~~~

- D freeland (VPN)      meta-exiguous

Router TCP/IP
~~~~~~~~~~~~~

- D ipsec-tools         meta-networking
- D iproute2            openembedded-core
- D tcp-wrappers        openembedded-core
- D rng-tools           meta-oe

Router PPP
~~~~~~~~~~

- D ppp                 openembedded-core
- D rp-pppoe            meta-networking

Server DNS
~~~~~~~~~~

- D bind                openembedded-core

Proxy
~~~~~

- D squid               meta-networking

Reverse Proxy
~~~~~~~~~~~~~

- D nginx               meta-webserver
- D varnish             meta-exiguous

---------------------------
Additional features for NAS
---------------------------

System
~~~~~~

 - D mdadm              openembedded-core

Newsgroups
~~~~~~~~~~

- D sabnzbd             meta-exiguous
- D headphones          meta-exiguous
- D sickbeard           meta-exiguous
- D couchpotato         meta-exiguous

torrent
~~~~~~~
- D ?

--------------------------
Additional features for CI
--------------------------

- D git                 openembedded-core
- D buildbot            meta-exiguous
- D gerrit              meta-exiguous
- D opengrok            opengrok
- D git-repo            git-repo

==============
Image features
==============

- Read-only root filesystem
- Kernel modules
- Openssh is replaced by Dropbear
- Enable hardware codecs by default
- Enable NFS server by default
- Enable SELinux by default

.. Package group features
.. ----------------------

.. - Common features
.. - Linux kernel v3.14 LTS

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

==================
Supported machines
==================

- Qemu-(x86-64|arm|arm64|mips|ppc)
- generic-x86-64
- Raspberry Pi rev. B
- BeagleBone Black rev. B

============
Contributing
============

------------
Mailing List
------------

Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-exiguous]' in the subject'

Feel free to ask any kind of questions but always prepend your email subject
with "[meta-exiguous]". This is because we use the 'yocto' mailing list and
not a perticular 'meta-exiguous' mailing list.

To contribute to this layer you should send the patches for review to the
above specified mailing list.
The patches should be compliant with the openembedded patch guidelines:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

To send changes to mailing list use something like:

::

  git send-email -M -1 --to openembedded-devel@lists.openembedded.org \
      --subject-prefix=meta-exiguous][PATCH

------------------
Forking via github
------------------

You are encouraged to fork the mirror on [github](https://github.com/tprrt/meta-exiguous/)
to share your patches, this is preferred for patch sets consisting of more than 
one patch. Other services like gitorious, repo.or.cz or self hosted setups are 
of course accepted as well, 'git fetch <remote>' works the same on all of them.
We recommend github because it is free, easy to use, has been proven to be reliable 
and has a really good web GUI.

Layer Maintainer: `Thomas Perrot <thomas.perrot@tupi.fr>`_

---------------------------------------
Adding the Exiguous layer to your build
---------------------------------------

In order to use this layer, you need to make the build system aware of
it.

Assuming the Exiguous layer exists at the top-level of your
OE build tree, you can add it to the build system by adding the
location of the Exiguous layer to bblayers.conf, along with any
other layers needed. e.g.:

::

  BBLAYERS ?= " \
    /path/to/yocto/meta \
    /path/to/yocto/meta-yocto \
    /path/to/yocto/meta-yocto-bsp \
    /path/to/yocto/meta-oe \
    /path/to/yocto/meta-networking \
    /path/to/yocto/meta-python \
    /path/to/yocto/meta-selinux \
    /path/to/yocto/meta-exiguous \
    "
