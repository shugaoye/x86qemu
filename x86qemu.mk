#
# Copyright (C) 2014 The Android-x86 Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# includes the base of Android-x86 platform
$(call inherit-product,device/generic/common/x86.mk)

# Overrides
PRODUCT_NAME := x86qemu
PRODUCT_BRAND := Android-x86
PRODUCT_DEVICE := x86qemu
PRODUCT_MODEL := x86qemu_ch14

TARGET_KERNEL_SOURCE := kernel
TARGET_KERNEL_CONFIG := android-x86_defconfig
TARGET_ARCH := x86

PRODUCT_OUT ?= out/target/product/$(PRODUCT_DEVICE)

include $(TARGET_KERNEL_SOURCE)/AndroidKernel.mk

# define build targets for kernel
.PHONY: $(TARGET_PREBUILT_KERNEL)

LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)

PRODUCT_PACKAGES += \
    mount.vboxsf \

PRODUCT_COPY_FILES += \
    device/generic/x86qemu/vbox/vboxguest.ko:system/vendor/vbox/vboxguest.ko \
    device/generic/x86qemu/vbox/vboxsf.ko:system/vendor/vbox/vboxsf.ko \
    device/generic/x86qemu/vbox/vboxvideo.ko:system/vendor/vbox/vboxvideo.ko \
    device/generic/x86qemu/fstab.x86:root/fstab.x86 \
    device/generic/x86qemu/recovery.fstab:recovery/root/etc/recovery.fstab \
    device/generic/x86qemu/recovery/root/init.recovery.x86qemu.rc:root/init.recovery.x86qemu.rc \
    device/generic/x86qemu/recovery/root/sbin/network_start.sh:recovery/root/sbin/network_start.sh \
    device/generic/x86qemu/recovery/root/sbin/init.x86qemu.sh:recovery/root/sbin/init.x86qemu.sh \
    device/generic/x86qemu/recovery/root/sbin/create_partitions.sh:recovery/root/sbin/create_partitions.sh \
    device/generic/x86qemu/recovery/root/sbin/mount.vboxsf:recovery/root/sbin/mount.vboxsf \
    device/generic/x86qemu/recovery/root/sbin/gdbserver:recovery/root/sbin/gdbserver \
    device/generic/x86qemu/recovery/root/sbin/parted:recovery/root/sbin/parted \
    device/generic/x86qemu/recovery/root/x86qemu/atkbd.ko:recovery/root/x86qemu/atkbd.ko \
    device/generic/x86qemu/recovery/root/x86qemu/cn.ko:recovery/root/x86qemu/cn.ko \
    device/generic/x86qemu/recovery/root/x86qemu/uvesafb.ko:recovery/root/x86qemu/uvesafb.ko \
    device/generic/x86qemu/recovery/root/x86qemu/drm.ko:recovery/root/x86qemu/drm.ko \
    device/generic/x86qemu/recovery/root/x86qemu/ttm.ko:recovery/root/x86qemu/ttm.ko \
    device/generic/x86qemu/recovery/root/x86qemu/drm_kms_helper.ko:recovery/root/x86qemu/drm_kms_helper.ko \
    device/generic/x86qemu/recovery/root/x86qemu/fb_sys_fops.ko:recovery/root/x86qemu/fb_sys_fops.ko \
    device/generic/x86qemu/recovery/root/x86qemu/sysimgblt.ko:recovery/root/x86qemu/sysimgblt.ko \
    device/generic/x86qemu/recovery/root/x86qemu/sysfillrect.ko:recovery/root/x86qemu/sysfillrect.ko \
    device/generic/x86qemu/recovery/root/x86qemu/syscopyarea.ko:recovery/root/x86qemu/syscopyarea.ko \
    device/generic/x86qemu/vbox/vboxguest.ko:recovery/root/x86qemu/vboxguest.ko \
    device/generic/x86qemu/vbox/vboxsf.ko:recovery/root/x86qemu/vboxsf.ko \
    device/generic/x86qemu/vbox/vboxvideo.ko:recovery/root/x86qemu/vboxvideo.ko \
    device/generic/x86qemu/recovery/root/lib/libc.so.6:recovery/root/lib/libc.so.6 \
    device/generic/x86qemu/recovery/root/lib/libcrypt.so.1:recovery/root/lib/libcrypt.so.1 \
    device/generic/x86qemu/recovery/root/lib/libdl.so.2:recovery/root/lib/libdl.so.2 \
    device/generic/x86qemu/recovery/root/lib/libm.so.6:recovery/root/lib/libm.so.6 \
    device/generic/x86qemu/recovery/root/lib/libntfs-3g.so.31:recovery/root/lib/libntfs-3g.so.31 \
    device/generic/x86qemu/recovery/root/lib/libpthread.so.0:recovery/root/lib/libpthread.so.0 \
    device/generic/x86qemu/recovery/root/lib/librt.so.1:recovery/root/lib/librt.so.1 \
    device/generic/x86qemu/recovery/root/bin/busybox:recovery/root/bin/busybox \
    device/generic/x86qemu/recovery/root/bin/ld-linux.so.2:recovery/root/bin/ld-linux.so.2 \
    device/generic/x86qemu/recovery/root/bin/lndir:recovery/root/bin/lndir \
    device/generic/x86qemu/recovery/root/system/bin/linker:recovery/root/system/bin/linker \
    device/generic/x86qemu/recovery/root/system/lib/libc.so:recovery/root/system/lib/libc.so \
    device/generic/x86qemu/recovery/root/system/lib/libc++.so:recovery/root/system/lib/libc++.so \
    device/generic/x86qemu/recovery/root/system/lib/libcutils.so:recovery/root/system/lib/libcutils.so \
    device/generic/x86qemu/recovery/root/system/lib/liblog.so:recovery/root/system/lib/liblog.so \
    device/generic/x86qemu/recovery/root/system/lib/libm.so:recovery/root/system/lib/libm.so \
    device/generic/x86qemu/recovery/root/system/lib/libpcre.so:recovery/root/system/lib/libpcre.so \
    device/generic/x86qemu/recovery/root/system/lib/libselinux.so:recovery/root/system/lib/libselinux.so \
    device/generic/x86qemu/recovery/root/system/lib/libext2_uuid.so:recovery/root/system/lib/libext2_uuid.so \
    $(LOCAL_KERNEL):kernel \

