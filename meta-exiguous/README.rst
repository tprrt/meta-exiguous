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
- layers: meta-oe, meta-networking, meta-python
- branch: master
- revision: HEAD
- prio: default

:meta-yocto:

- URI: git://git.yoctoproject.org/meta-yocto
- layers: meta-yocto, meta-yocto-bsp
- branch: master
- revision: HEAD
- prio: default

:meta-selinux:

- URI: git://git.yoctoproject.org/meta-selinux
- branch: master
- revision: HEAD
- prio: default

:meta-virtualization:

- URI: git://git.yoctoproject.org/meta-virtualization
- branch: master
- revision: HEAD
- prio: default

:meta-security:

- URI: git://git.yoctoproject.org/meta-security
- branch: master
- revision: HEAD
- prio: default

.. :meta-measured:
..
.. - URI: git://git@github.com:flihp/meta-measured.git
.. - branch: master
.. - revision: HEAD
.. - prio: default

.. :meta-musl:
..
.. - URI: git://git@github.com:kraj/meta-musl.git
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
- E sysklogd            openembedded-core
- E acpid               openembedded-core
- E tzdata              openembedded-core
- E acl                 openembedded-core
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

- D lxc                 meta-virtualization

- D pkg-tpm             meta-measured

- E makedumpfile        meta-exiguous (imported from meta-cgl)
- E thermald            meta-exiguous

Optimization
~~~~~~~~~~~~~

- E prelink             openembedded-core

- E zram                meta-oe

- D preload		meta-exiguous

Network
~~~~~~~

- E iptables            openembedded-core
- E dropbear            openembedded-core
- E avahi               openembedded-core

- E samba               meta-oe

- D freelan (VPN)       meta-exiguous

Security
~~~~~~~~

- E security flags      openembedded-core

- E audit               meta-selinux
- E pkg-core-selinux    meta-selinux

- D fail2ban            meta-exiguous
- D denyhost            meta-exiguous

Backup
~~~~~~

- D unison              meta-exiguous

--------------
Extra packages
--------------
  
Debug-tools
~~~~~~~~~~~

- E gdbserver           openembedded-core             (only for DEBUG)
- E gdb                 openembedded-core             (only for DEBUG)    

- E crash               meta-oe                       (only for DEBUG)

Debug symbols
~~~~~~~~~~~~~

- D ???                 meta-exiguous                 (only for DEBUG)

Tests
~~~~~

- D ptests              openembedded-core             (only for DEBUG)
- D ptest-runner        openembedded-core             (only for DEBUG)

- D pm-qa               meta-oe                       (only for DEBUG)

Profiling
~~~~~~~~~

- E strace              openembedded-core             (only for DEBUG)
- E perf                openembedded-core             (only for DEBUG)
- E oprofile            openembedded-core             (only for DEBUG)
- E valgrind            openembedded-core             (only for DEBUG)

- E ltrace              meta-oe                       (only for DEBUG)

Security analysis
~~~~~~~~~~~~~~~~~

- E checksec            meta-security                 (only for DEBUG)
- E checksecurity       meta-security                 (only for DEBUG)
- E nikto               meta-security                 (only for DEBUG)
- E nmap                meta-security                 (only for DEBUG)
- E buck-security       meta-security                 (only for DEBUG)

-------------------------------
Additional features for station
-------------------------------

- E sudo                openembedded-core
- E wayland             openembedded-core

- E pkg-xfce-base       meta-xfce
- E pkg-xfce-extended   meta-xfce
- E pkg-xfce-multimedia meta-xfce

- D byobu               meta-exiguous

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

IRC Bouncer
~~~~~~~~~~~

- D znc                 meta-networking

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

- D minidlna            meta-oe

----------------------------
Additional features for htpc
----------------------------

- D xbmc/kodi           meta-multimedia/meta-kodi

--------------------------
Additional features for CI
--------------------------

- D git                 openembedded-core

- D buildbot            meta-exiguous
- D gerrit              meta-exiguous
- D opengrok            meta-exiguous
- D git-repo            meta-exiguous

==================
Supported machines
==================

:Current:

- qemux86-64
- generic-x86-64
- Raspberry Pi rev. B
- BeagleBone Black rev. B

:Next:

- SAMA5D3 Xplained
- SABRE Lite Design (BD-SL-i.MX6)
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
    /path/to/yocto/meta \
    /path/to/yocto/meta-yocto \
    /path/to/yocto/meta-yocto-bsp \
    /path/to/yocto/meta-oe \
    /path/to/yocto/meta-networking \
    /path/to/yocto/meta-systemd \
    /path/to/yocto/meta-python \
    /path/to/yocto/meta-selinux \
    /path/to/yocto/meta-virtualization \
    /path/to/yocto/meta-security \
    /path/to/yocto/meta-exiguous \
    "
