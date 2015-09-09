..
.. -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

This README file contains information on the contents of the ERgO (Exploration ROver) layer.

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

.. :meta-intel:
..
.. - URI: git://git.yoctoproject.org/meta-intel
.. - branch: master
.. - revision: HEAD

======================
Machines configuration
======================

:v0.1:

- DFRobot Romeo v1 (Arduino sketch)
- 4x DC geared Motors
- Bluetooth
- 3x Ultrasonic sensors
- Ambient sensors

:v0.2:

- Raspberry PI rev.B (OS based on BuildRoot)
- DFRobot Romeo v1 USB serial (Firmware based on an Arduino sketch)
- 4x DC geared Motors
- 3x Ultrasonic sensors
- I2C to GPIO modules
- Ambient sensors

:v1.0:

- Raspberry PI rev.B (OS based on OpenEmbedded/Yocto)
- SDcard ?? 64go
- DFRobot Romeo v1 USB serial (Firmware based on an Arduino sketch)
- 4x DC geared Motors
- 3x Ultrasonic sensors
- I2C to GPIO modules
- Ambient sensors

:v1.1:

- Raspberry PI rev.B (OS based on OpenEmbedded/Yocto)
- SDcard ?? 64go
- DFRobot Romeo v1 USB serial (Firmware based on ChibiOS + specific kernel Linux driver)
- 4x DC geared Motors
- 3x Ultrasonic sensors
- I2C to GPIO modules
- Ambient sensors

:v2.0:

- Beagle Bone Black rev.B (OS based on OpenEmbedded/Yocto )
- micro SDcard ?? 32go
- DFRobot Romeo v1 USB serial (Firmware based on ChibiOS + specific kernel Linux driver)
- 4x DC geared Motors
- 3x Ultrasonic sensors
- I2C to GPIO modules
- Ambient sensors

:v2.1 (current):

- Beagle Bone Black rev.B (OS based on OpenEmbedded/Yocto)
- micro SDcard ?? 32go
- DFRobot Romeo v1 USB serial (Firmware based on ChibiOS + specific kernel Linux driver)
- 4x DC geared Motors
- 3x Ultrasonic sensors
- 3x IR Sensors
- I2C to GPIO modules
- Ambient sensors

:v3.0 (next step):

- DFRobot Romeo for Edison Controller (OS based on OpenEmbedded/Yocto)
- 4x DC geared Motors
- 3x Ultrasonic sensors
- 3x IR Sensors
- I2C to GPIO modules
- Ambient sensors

============
Contributing
============

Mailing List
------------

Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-ergo]' in the subject'

Feel free to ask any kind of questions but always prepend your email subject
with "[meta-ergo]". This is because we use the 'yocto' mailing list and
not a perticular 'meta-ergo' mailing list.

To contribute to this layer you should send the patches for review to the
above specified mailing list.
The patches should be compliant with the openembedded patch guidelines:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

To send changes to mailing list use something like:

::

  git send-email -M -1 --to openembedded-devel@lists.openembedded.org \
      --subject-prefix=meta-ergo][PATCH

Forking via github
------------------

You are encouraged to fork the mirror on [github](https://github.com/tprrt/meta-exiguous/)
to share your patches, this is preferred for patch sets consisting of more than
one patch. Other services like gitorious, repo.or.cz or self hosted setups are
of course accepted as well, 'git fetch <remote>' works the same on all of them.
We recommend github because it is free, easy to use, has been proven to be reliable
and has a really good web GUI.

Layer Maintainer: `Thomas Perrot <thomas.perrot@tupi.fr>`_

===================================
Adding the ERgO layer to your build
===================================

In order to use this layer, you need to make the build system aware of
it.

Assuming the ERgO layer exists at the top-level of your
OE build tree, you can add it to the build system by adding the
location of the ERgO layer to bblayers.conf, along with any
other layers needed. e.g.:

::

  BBLAYERS ?= " \
    /path/to/yocto/meta \
    /path/to/yocto/meta-yocto \
    /path/to/yocto/meta-raspberrypi \
    /path/to/yocto/meta-ti \
    /path/to/yocto/meta-ergo \
    "
