..
.. -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

Brief description of the layers's collection
--------------------------------------------

Please see the respective README files in each layer subdirectories for more information.

- **meta-exiguous**: Exiguous distribution layer (forward port, working in progress)
- **meta-tupi**: Machines configuration layer for homemade NAS, HTPC, router... (not uploaded, forward port doesn't started)
- **meta-ergo**: Machines configuration layer for a exploration rover (not uploaded, forward port doesn't started)
- **meta-heart**: Machines configuration layer for a home automation station (not uploaded, forward port doesn't started)
- **scripts**: Useful tools to build, to flash... (forward port, working in progress)
- **config**: combo-layer configurations to build Exiguous distributions

To Do
-----

- Update CI tests to run them on github, blessing travis, circle...
- Clean and upstream stable distribution layer
- Clean and upstream machines layers
- Clean and upstream new recipes

- [heart] Add the list of sensors
- [common] Complete the list of packages for profiling
- [exiguous] kernel SERIAL_CONSOLE configuration
- [exiguous] kernel CMDLINE configuration (loglevel, earlyprintk....)
- [exiguous] kernel CMDLINE_DEBUG  (loglevel, earlyprintk, crashkernel....)
- [exiguous] kernel APPEND (netconsole...)
- [exiguous] Enable overlayfs
- [exiguous] Enable zram only if swap is enabled
- [exiguous] Enable Exiguous debug symbols package
- [exiguous] Enable Exiguous tests package
- [exiguous] Enable ${PN}-features-station
- [exiguous] Enable ${PN}-features-router
- [exiguous] Enable ${PN}-features-nas
- [exiguous] Enable ${PN}-features-mediaserver
- [exiguous] Enable ${PN}-features-htpc
- [exiguous] Enable ${PN}-features-ci
- [exiguous] usbhost usbutils usbgadget
- [exiguous] Add openssh to BACKFILL CONSIDERED... ?
- [exiguous] Try to enable Exiguous on initramfs-kexecboot-klibc-image
- [script] Add a target to build all available target
- [script] Add a target to run oe-selftest
- [script] Add a target to update combination layer
- [script] Add a target to publish images built
- [script] Add a target to build world
- [script] If the build is well finished then update combination layer and publish

Upstreaming
-----------

Mailing List
============

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

Forking via github
==================

You are encouraged to fork the mirror on [github](https://github.com/tprrt/meta-exiguous/)
to share your patches, this is preferred for patch sets consisting of more than 
one patch. Other services like gitorious, repo.or.cz or self hosted setups are 
of course accepted as well, 'git fetch <remote>' works the same on all of them.
We recommend github because it is free, easy to use, has been proven to be reliable 
and has a really good web GUI.

Layer Maintainer: `Thomas Perrot <thomas.perrot@tupi.fr>`_
