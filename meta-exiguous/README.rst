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
- optional layers: meta-networking, meta-python, meta-webserver, meta-multimedia
- branch: master
- revision: HEAD
- prio: default

:meta-yocto:

- URI: git://git.yoctoproject.org/meta-yocto
- layers: meta-poky
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

TODO

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

Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-tprrt]' in the subject'

Feel free to ask any kind of questions but always prepend your email subject
with "[meta-tprrt]". This is because we use the 'yocto' mailing list and
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

You are encouraged to fork the mirror on [github](https://github.com/tprrt/meta-tprrt/)
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
    /path/to/combination/meta-yocto/meta-poky \
    /path/to/combination/meta-openembedded/meta-oe \
    /path/to/combination/meta-openembedded/meta-initramfs \
    /path/to/combination/meta-openembedded/meta-systemd \
    /path/to/combination/meta-openembedded/meta-virtualization \
    /path/to/combination/meta-openembedded/meta-security \
    /path/to/combination/meta-tprrt/meta-exiguous-bsp \
    "
