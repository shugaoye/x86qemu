#!/bin/busybox sh 

echo -n "Initializing x86vbox hardware ..."
PATH=/bin:/sbin:/bin; export PATH

cd /bin;busybox --install -s

cd /x86vbox
insmod atkbd.ko
insmod vboxguest.ko
insmod vboxsf.ko
insmod cn.ko
# insmod drm.ko
# insmod ttm.ko
# insmod fb_sys_fops.ko
# insmod sysimgblt.ko
# insmod sysfillrect.ko
# insmod syscopyarea.ko
# insmod drm_kms_helper.ko
# insmod vboxvideo.ko
insmod uvesafb.ko mode_option=${UVESA_MODE:-1024x768}-32

/sbin/mount.vboxsf x86vbox /mnt
