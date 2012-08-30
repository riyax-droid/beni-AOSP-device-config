# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/samsung/Beni/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := Beni
PRODUCT_DEVICE := Beni
PRODUCT_MODEL := GT-S5670

PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni \
    Gallery3d \
    SpareParts \
    Development \
    Term \
    libOmxVidEnc \
    libOmxCore \
    libmm-omxcore \
    libstagefrighthw \
    gralloc.Beni \
    copybit.Beni \
    make_ext4fs \
    dexpreopt \
    bdaddr_read \
    libcamera \
    toggleshutter \
    screencap \
    FileManager \
    su \
    FM \
    hcitool \
    busybox

# proprietary side of the device
$(call inherit-product-if-exists, vendor/samsung/Beni/Beni-vendor.mk)

DISABLE_DEXPREOPT := false

# Add LDPI assets, in addition to MDPI
PRODUCT_LOCALES += ldpi mdpi

#
# Setup device specific product configuration.
#
PRODUCT_BUILD_PROP_OVERRIDES += \
 PRODUCT_NAME=GT-S5670 \
 BUILD_ID=GWK74 \
 BUILD_DISPLAY_ID=GWK74_BETA_2

## APN Config
PRODUCT_COPY_FILES += \
    device/samsung/Beni/configs/apns-conf.xml:system/etc/apns-conf.xml

## Keymaps
PRODUCT_COPY_FILES += \
    device/samsung/Beni/keys/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/Beni/keys/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl \
    device/samsung/Beni/keys/sec_key.kl:system/usr/keylayout/sec_key.kl \
    device/samsung/Beni/keys/sec_key.kcm.bin:system/usr/keychars/sec_key.kcm.bin \
    device/samsung/Beni/keys/sec_touchscreen.kcm.bin:system/usr/keychars/sec_touchscreen.kcm.bin

## su
PRODUCT_COPY_FILES += \
    device/samsung/Beni/prebuilt/xbin/su:system/xbin/su 

# fstab
PRODUCT_COPY_FILES += \
    device/samsung/Beni/configs/vold.fstab:system/etc/vold.fstab

# Board-specific init
PRODUCT_COPY_FILES += \
    device/samsung/Beni/ueventd.gt-s5670.rc:root/ueventd.gt-s5670.rc \
    device/samsung/Beni/prebuilt/modules/recovery/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/Beni/prebuilt/modules/recovery/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/Beni/prebuilt/modules/recovery/rfs_fat.ko:root/lib/modules/rfs_fat.ko \
    device/samsung/Beni/prebuilt/modules/recovery/rfs_glue.ko:root/lib/modules/rfs_glue.ko \
    device/samsung/Beni/prebuilt/modules/recovery/sec_param.ko:root/lib/modules/sec_param.ko \
    device/samsung/Beni/BENI.rle:root/BENI.rle \
    device/samsung/Beni/init.gt-s5670.rc:root/init.gt-s5670.rc

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/Beni/configs/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/Beni/configs/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

## Wifi Stuff
PRODUCT_COPY_FILES += \
    device/samsung/Beni/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/Beni/configs/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/Beni/prebuilt/get_macaddrs:system/bin/get_macaddrs \
    device/samsung/Beni/configs/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf 

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

#Kernel Modules
PRODUCT_COPY_FILES += \
    device/samsung/Beni/prebuilt/modules/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/Beni/prebuilt/modules/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/Beni/prebuilt/modules/sec_param.ko:root/lib/modules/sec_param.ko \
    device/samsung/Beni/prebuilt/ar6000.ko:system/wifi/ar6000.ko \
    device/samsung/Beni/prebuilt/cifs.ko:system/lib/modules/2.6.32.9-perf/cifs.ko \
    device/samsung/Beni/prebuilt/zram.ko:system/lib/modules/2.6.32.9-perf/zram.ko
    
#Kernel Modules for Recovery (RFS)
PRODUCT_COPY_FILES += \
    device/samsung/Beni/prebuilt/modules/recovery/fsr.ko:recovery/root/lib/modules/fsr.ko \
    device/samsung/Beni/prebuilt/modules/recovery/fsr_stl.ko:recovery/root/lib/modules/fsr_stl.ko \
    device/samsung/Beni/prebuilt/modules/recovery/rfs_fat.ko:recovery/root/lib/modules/rfs_fat.ko \
    device/samsung/Beni/prebuilt/modules/recovery/rfs_glue.ko:recovery/root/lib/modules/rfs_glue.ko \
    device/samsung/Beni/prebuilt/modules/recovery/sec_param.ko:recovery/root/lib/modules/sec_param.ko

#Media profile
PRODUCT_COPY_FILES += \
    device/samsung/Beni/configs/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PROPERTY_OVERRIDES := \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.android.dataroaming=false

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.heapsize=32m \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.dexopt-data-only=1 \
    ro.compcache.default=0
# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/samsung/Beni/Beni-vendor-blobs.mk)
