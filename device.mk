#
# Copyright (C) 2020 The LineageOS Project
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

# Properties
-include $(LOCAL_PATH)/system_prop.mk

# Charger
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/charger/images/battery_fail.png:$(TARGET_COPY_OUT_PRODUCT)/etc/res/images/charger/battery_fail.png \
    $(LOCAL_PATH)/charger/images/battery_scale.png:$(TARGET_COPY_OUT_PRODUCT)/etc/res/images/charger/battery_scale.png \
    $(LOCAL_PATH)/charger/images/main_font.png:$(TARGET_COPY_OUT_PRODUCT)/etc/res/images/charger/main_font.png \
    $(LOCAL_PATH)/charger/values/animation.txt:$(TARGET_COPY_OUT_PRODUCT)/etc/res/values/charger/animation.txt

# Enable dynamic partition size
PRODUCT_USE_DYNAMIC_PARTITION_SIZE := true

# init scripts
PRODUCT_PACKAGES += \
    init.disabled.rc \
    init.halium.rc \
    vndk-detect \
    on-post-data.sh

# Support for the O devices
PRODUCT_COPY_FILES += \
    build/make/target/product/vndk/init.gsi.rc:system/etc/init/init.gsi.rc \
    build/make/target/product/vndk/init.vndk-27.rc:system/etc/init/gsi/init.vndk-27.rc \
    $(LOCAL_PATH)/configs/ld.config.26.txt:system/etc/ld.config.26.txt

PRODUCT_PACKAGES += \
    init.vndk-26.rc \
    ld.config.27.txt \
    llndk.libraries.27.txt \
    vndksp.libraries.27.txt

PRODUCT_PACKAGES += \
    vndk_v27_arm64

# Name space configuration file for non-enforcing VNDK
PRODUCT_PACKAGES += \
    ld.config.vndk_lite.txt

# SPL fix
PRODUCT_PACKAGES += \
    getSPL

# Test tools
PRODUCT_PACKAGES += \
    bootctl \
    vintf

# Misc
PRODUCT_PACKAGES += \
    libandroid \
    libandroid_runtime \
    libdrm \
    libion \
    vendor.display.config@1.7

# Media
PRODUCT_PACKAGES += \
    libmedia_omx \
    android.frameworks.displayservice@1.0 \
    drmserver \
    mediadrmserver \
    mediaextractor \
    miniafservice

PRODUCT_PACKAGES += \
    sensorservice

# HFD
PRODUCT_PACKAGES += \
    libhfd_api
    
# Camera
PRODUCT_PACKAGES += \
    vendor.lineage.camera.motor@1.0
