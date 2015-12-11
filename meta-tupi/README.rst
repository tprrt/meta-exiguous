..
.. -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

This README file contains information on the contents of the
Tupi layer.

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

:meta-raspberrypi:

- URI: git://git.yoctoproject.org/meta-raspberrypi
- branch: master
- revision: HEAD

:meta-ti:

- URI: git://git.yoctoproject.org/meta-ti
- branch: master
- revision: HEAD

:meta-intel:

- URI: git://git.yoctoproject.org/meta-intel
- branch: master
- revision: HEAD

======================
Machines configuration
======================

:Homemade Router v1.0 (current):

- Beagle Bone Black rev.B
- micro SDcard ?? 32go
- D-Link USB 2.0 Fast Ethernet Adapter (DUB-E100)

:Homemade Router v2.0 (next step):

- Atmel SAMA5D3 Xplained
  - SAMA5D36 Cortex-A5 Microprocessor
  - 256MBytes DDR2
  - 256MBytes NAND Flash
  - LCD connectors
  - Dual Ethernet (GMAC + EMAC) with PHY and connectors
  - Three USB connectors (2 Host + 1 Device)
  - 1x SD/eMMC and 1x MicroSD slots
  - Expansions headers, Arduino R3 Shield compatible
  - Power measurement straps

:Homemade Home Theatre PC/Game emulator v1.0 (current):

- Raspberry PI rev.B
- SDcard ?? 64go
- Logitech wireless keyboard and mouse
- Dongle USB Bluetooth    
- Playstation Dualshock 3

:Homemade Home Theatre PC/Game emulator v2.0 (next step):

- Raspberry PI 2 rev.B
- SDcard ?? 64go
- Logitech wireless keyboard and mouse
- Dongle USB Bluetooth    
- Playstation Dualshock 3

:Homemade CI/NAS/Media server v1.0:

- Intel i5-3570K
- DDR3 8go
- RAID 1 soft (root)
  - 2x SSD Samsung 830 64go
- RAID 10 hardware (data)
  - 4x Seagate 7200tr/min 2To
- JBOD soft (backup)
  - 2x Seagate 7200tr/min 2To

:Homemade Desktop v1.0:

- Intel i7-3770K
- DDR3 16Go
- 1x SSD Samsung 830 250go

:Laptop Thinkpad X220:

- Intel i5-2540M
- DDR3 8go
- SSD Samsung 830 64go

============
Contributing
============

Mailing List
------------

Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-tupi]' in the subject'

Feel free to ask any kind of questions but always prepend your email subject
with "[meta-tupi]". This is because we use the 'yocto' mailing list and
not a perticular 'meta-tupi' mailing list.

To contribute to this layer you should send the patches for review to the
above specified mailing list.
The patches should be compliant with the openembedded patch guidelines:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

To send changes to mailing list use something like:

::

  git send-email -M -1 --to openembedded-devel@lists.openembedded.org \
      --subject-prefix=meta-tupi][PATCH

Forking via github
------------------

You are encouraged to fork the mirror on [github](https://github.com/tprrt/meta-tupi/)
to share your patches, this is preferred for patch sets consisting of more than
one patch. Other services like gitorious, repo.or.cz or self hosted setups are
of course accepted as well, 'git fetch <remote>' works the same on all of them.
We recommend github because it is free, easy to use, has been proven to be reliable
and has a really good web GUI.

Layer Maintainer: `Thomas Perrot <thomas.perrot@tupi.fr>`_

===================================
Adding the Tupi layer to your build
===================================

In order to use this layer, you need to make the build system aware of
it.

Assuming the Tupi layer exists at the top-level of your
OE build tree, you can add it to the build system by adding the
location of the Tupi layer to bblayers.conf, along with any
other layers needed. e.g.:

  BBLAYERS ?= " \
    /path/to/yocto/meta \
    /path/to/yocto/meta-yocto \
    /path/to/yocto/meta-yocto-bsp \
    /path/to/yocto/meta-raspberrypi \
    /path/to/yocto/meta-ti \
    /path/to/yocto/meta-intel \
    "
