..
.. -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

This README file contains information on the contents of the HEArT (HomE Automation sTation) layer.

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

:meta-raspberrypi:

- URI: git://git.yoctoproject.org/meta-raspberrypi
- branch: master
- revision: HEAD

======================
Machines configuration
======================


:Homemade openHab station v1.0:

.. # FIXME [heart] Add the list of sensors

- Raspberry PI rev.B
  - SDRAM 512MB
- SDcard Lexar SD Card 32GB 400X Professional UHS-I
- I2C to GPIO modules
- Digital sensors
- I2C sensors
- Analog sensors

============
Contributing
============

Mailing List
------------

Send pull requests to openembedded-devel@lists.openembedded.org with '[meta-heart]' in the subject'

Feel free to ask any kind of questions but always prepend your email subject
with "[meta-heart]". This is because we use the 'yocto' mailing list and
not a perticular 'meta-heart' mailing list.

To contribute to this layer you should send the patches for review to the
above specified mailing list.
The patches should be compliant with the openembedded patch guidelines:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

To send changes to mailing list use something like:

::

  git send-email -M -1 --to openembedded-devel@lists.openembedded.org \
      --subject-prefix=meta-heart][PATCH

Forking via github
------------------

You are encouraged to fork the mirror on [github](https://github.com/tprrt/meta-heart/)
to share your patches, this is preferred for patch sets consisting of more than
one patch. Other services like gitorious, repo.or.cz or self hosted setups are
of course accepted as well, 'git fetch <remote>' works the same on all of them.
We recommend github because it is free, easy to use, has been proven to be reliable
and has a really good web GUI.

Layer Maintainer: `Thomas Perrot <thomas.perrot@tupi.fr>`_

====================================
Adding the HEArT layer to your build
====================================

In order to use this layer, you need to make the build system aware of
it.

Assuming the Tupi layer exists at the top-level of your
OE build tree, you can add it to the build system by adding the
location of the Tupi layer to bblayers.conf, along with any
other layers needed. e.g.:

::

  BBLAYERS ?= " \
    /path/to/yocto/meta \
    /path/to/yocto/meta-raspberrypi \
    /path/to/yocto/meta-heart \
    "
