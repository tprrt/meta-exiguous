#!/bin/sh
# -*- coding: utf-8; tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-

# Init script used to bootstrap Exiguous distribution
# Copyright (C) 2014  Thomas Perrot <thomas.perrot@tupi.fr>

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA

umask 022

PATH=/sbin:/bin:/usr/sbin:/usr/bin

LOG_FILE=/initramfs.log

CONSOLE=/dev/console

ROOT_DIR=/mnt/root
KDUMP_DIR=/mnt/kdump

msg() {
    echo "initramfs: $@" >$CONSOLE | tee -a $LOG_FILE >&2
}

do_mount() {
    [ ! -d $3 ] && mkdir -p $3
    mount -t $1 $2 $3 ; status=$?
    if [ $status -ne 0 ] ; then
        msg "ERROR: Unable to mount $2 to $3 !!!"
    fi
    return $status
}

do_move() {
    [ ! -d $2 ] && mkdir -p $2
    mount -n --move $1 $2 ; status=$?
    if [ $status -ne 0 ] ; then
        msg "ERROR: Unable to move $1 to $2 !!!"
    fi
    return $status
}

# -----------------------------------------------------------------------------
# Main function
# -----------------------------------------------------------------------------

# Initialize /proc, /sys and /dev
# -----------------------------------------------------------------------------

do_mount proc proc /proc

do_mount sysfs sysfs /sys

do_mount devtmpfs devtmpfs /dev

# Parse the kernel cmdline
# -----------------------------------------------------------------------------
msg "Parsing the kernel cmdline..."

[ -z "$CMDLINE" ] && CMDLINE=$(cat /proc/cmdline)

for arg in $CMDLINE ; do
    case arg in
        root=*)
            $ROOT_FS=${arg#root=}
            ;;
        rootfstype=*)
            $ROOT_FS_TYPE=${arg#rootfstype=}
            ;;
        initrd=*)
            $INITRD=${arg#initrd=}
            ;;
        init=*)
            $INIT=${arg#init=}
            ;;
        rootdelay=*)
            rootdelay=${arg#rootdelay=}
            ;;
        *)
            ;;
    esac
done

# Repair mechanism of filesystem
# -----------------------------------------------------------------------------

delay=${rootdelay:-5}
log "waiting $delay seconds to let the kernel be aware of devices..."
sleep $delay

# To avoid problems which can occur if / is mounted read-only and the information in /etc/mtab is stale
ln -s /proc/mounts /etc/mtab

# FIXME [exiguous] Re-enable repair mechanism of filesystem

# Kernel coredump mechanism
# -----------------------------------------------------------------------------

KEXEC_CMD="kexec $TMP_DIR/vmlinuz --initrd=$INITRD"
case "$(uname -m)" in
    arm*)
        KEXEC_CMD="$KEXEC_CMD --type=zImage"
        ;;
    *)
        ;;
esac

# FIXME [exiguous] Identify the material to adjust the parameter in --dtb of kexec_cmd
# if [ -s /proc/device-tree ] ; then
#     kexec_cmd="$kexec_cmd --dtb=????"
# fi

if [ -s /proc/vmcore ] ; then
    # If we have a /proc/vmcore, then we just kdump'ed
    msg "Save kernel coredump"

    # Mount the partition to save kernel coredump
    do_mount $ROOT_FS_TYPE $ROOT_FS $KDUMP_DIR
    if [ $? -ne 0 ] ; then
        msg "Unable to mount the partition to save kernel coredump, restarts without saving"
        # FIXME [exiguous] Enable quick reboot using kexec instead the reboot command
        reboot -f 0
    fi

    [ -d $KDUMP_DIR/var/spool/kerneldump ] && mkdir -p $KDUMP_DIR/var/spool/kerneldump

    # Save kernel panic coredump
    SUFFIX=$(date +"%Y%m%d%H%M")
    makedumpfile -c -d 31 /proc/vmcore $TMP_DIR/var/spool/kerneldump/vmcore.$SUFFIX
    sync
    umount $TMP_DIR

    # FIXME [exiguous] Enable quick reboot using kexec instead the reboot command
    # quick reboot
    # KEXEC_CMD="$KEXEC_CMD -l --command-line=\"$CMDLINE\""

    # eval $KEXEC_CMD

    # if [ $? -ne 0 ] ; then
    #     msg "ERROR: Failed to load the kernel to reboot !!!"
    # fi

    # kexec -e
    reboot -f 0

elif [ -s /proc/kcore ] ; then
    # Else, we've just booted and need to load the kdump kernel
    msg "Start kdump kernel"

    KDUMP_ARGS=$(echo $CMDLINE | \
        sed -r -e 's/(^| )crashkernel=[^ ]*//g' \
            -e 's/(^| )abm=[^ ]*//g')

    KEXEC_CMD="$KEXEC_CMD -p --command-line=\"$KDUMP_ARGS\""

    eval $KEXEC_CMD

    if [ $? -ne 0 ] ; then
        msg "ERROR: Failed to load kdump kernel !!!"
    fi
fi

# Fallback mechanism
# -----------------------------------------------------------------------------

# FIXME [exiguous] Re-enable fallback mecanism

# Mount real root filesystem
# -----------------------------------------------------------------------------

msg "Mounting partitions..."

do_mount $ROOT_FS_TYPE $ROOT_FS $ROOT_DIR || sh <$CONSOLE >$CONSOLE 2>$CONSOLE

# Switch to real root filesystem
# -----------------------------------------------------------------------------

msg "Switching to real root filesystem..."

do_move /proc $ROOT_DIR/proc

do_move /sys $ROOT_DIR/sys

do_move /dev $ROOT_DIR/dev

[ ! -d $ROOT_DIR/var/log ] && mkdir -p $ROOT_DIR/var/log
mv $LOG_FILE $ROOT_DIR/var/log/

cd $ROOT_DIR

switch_root -c $CONSOLE $ROOT_DIR ${INIT:-/sbin/init} $CMDLINE \
    || sh <$CONSOLE >$CONSOLE 2>$CONSOLE
