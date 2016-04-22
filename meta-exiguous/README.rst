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

:meta-openembedded:

- URI: git://git.openembedded.org/meta-openembedded
- layers: meta-oe, meta-systemd
- optional layers: meta-networking, meta-xfce, meta-python, meta-webserver, meta-multimedia
- branch: master
- revision: HEAD
- prio: default

:meta-yocto:

- URI: git://git.yoctoproject.org/meta-yocto
- layers: meta-yocto
- branch: master
- revision: HEAD
- prio: default

:meta-virtualization:

- URI: git://git.yoctoproject.org/meta-virtualization
- branch: master
- revision: HEAD
- prio: default

.. :meta-measured:
..
.. - URI: git://git@github.com:flihp/meta-measured.git
.. - branch: master
.. - revision: HEAD
.. - prio: default

.. :meta-clang:
..
.. - URI: git://git@github.com:kraj/meta-clang.git
.. - branch: master
.. - revision: HEAD
.. - prio: default

.. :meta-ros:
.. - URI: git://git@github.com:bmwcarit/meta-ros.git
.. - branch: master
.. - revision: HEAD
.. - prio: default

===============
Distro features
===============

-------------
Core packages
-------------

System
~~~~~~

- E hwcodecs            openembedded-core
- E read-only-rootfs    openembedded-core
- E kernel Linux v4.1   openembedded-core
- E systemd             openembedded-core
- E dbus                openembedded-core
- E watchdog            openembedded-core
- E cronie              openembedded-core
- E acpid/apmd          openembedded-core
- E tzdata              openembedded-core
- E usbhost             openembedded-core
- E usbutils            openembedded-core
- E usbgadget           openembedded-core
- E rsync               openembedded-core
- E pm-utils            openembedded-core
- E pigz                openembedded-core
- E busybox             openembedded-core
- E procps              openembedded-core
- E kexec               openembedded-core

- E cryptsetup          meta-oe
- E udisks              meta-oe
- E networkmanager      meta-oe
- E lvm2                meta-oe

- E lxc                 meta-virtualization

- D pkg-tpm             meta-exiguous (a fork of recipes from meta-measured)

- E makedumpfile        meta-exiguous (a fork of recipes from meta-cgl)
- E thermald            meta-exiguous

Optimization
~~~~~~~~~~~~~

- E prelink             openembedded-core

- E zram                meta-oe

- E preload		meta-exiguous

Network
~~~~~~~

- E dropbear            openembedded-core
- E avahi               openembedded-core

- E nftables            meta-oe
- E samba               meta-oe

- D freelan (VPN)       meta-exiguous

Security
~~~~~~~~

- E security flags      openembedded-core

- E fail2ban            meta-exiguous
- E denyhosts           meta-exiguous
- D knockd              meta-exiguous

Backup
~~~~~~

- D unison              meta-exiguous

-------------------------------
Additional features for station
-------------------------------

- E sudo                openembedded-core
- E wayland             openembedded-core

- E emacs               meta-oe
- E irssi               meta-oe
- E picocom             meta-oe
- E tree                meta-oe

- E pkg-xfce-base       meta-xfce
- E pkg-xfce-extended   meta-xfce
- E pkg-xfce-multimedia meta-xfce

- D byobu               meta-exiguous
- D meld                meta-exiguous
- D chromium            meta-exiguous

---------------------------------------------------------------------
Additional features for Router/Bridge/Firewall/DNS/Proxy/ReverseProxy
---------------------------------------------------------------------

Router Freelan
~~~~~~~~~~~~~~

- D freeland (VPN)      meta-exiguous

Router TCP/IP
~~~~~~~~~~~~~

- D iproute2            openembedded-core
- D tcp-wrappers        openembedded-core

- D rng-tools           meta-oe

- D ipsec-tools         meta-networking

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

- D memcached           meta-networking

- D varnish             meta-exiguous

IRC Bouncer/Bots
~~~~~~~~~~~~~~~~

- D znc                 meta-networking
- D notifico            meta-exiguous
- D cardinal            meta-exiguous

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

------------------------------------
Additional features for media server
------------------------------------

- D ReadyMedia          meta-oe

----------------------------
Additional features for htpc
----------------------------

- D kodi                meta-exiguous (a fork of recipes from meta-kodi)
- D libretro            meta-exiguous
- D EmulationStation    meta-exiguous
- D Bluetooth-tools     meta-exiguous (a fork of recipes from meta-tizen)

--------------------------
Additional features for CI
--------------------------

- D git                 openembedded-core

- D buildbot            meta-exiguous
- D gerrit              meta-exiguous
- D opengrok            meta-exiguous
- D git-repo            meta-exiguous
- D toaster             meta-exiguous
- D autobuilder         meta-exiguous

==================
Supported machines
==================

:Current:

- qemu-exiguous
- corei7-64
- Raspberry Pi rev.B
- Raspberry Pi 2 rev.B
- BeagleBone Black rev.B

:Next:

- ODROID-C2
- Raspberry Pi 3 rev.B
- Atmel SAMA5D3 Xplained
- DFRobot Romeo for Edison Controller

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
    /path/to/combination/meta \
    /path/to/combination/meta-yocto \
    /path/to/combination/meta-oe \
    /path/to/combination/meta-initramfs \
    /path/to/combination/meta-systemd \
    /path/to/combination/meta-virtualization \
    /path/to/combination/meta-exiguous \
    "
