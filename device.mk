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

# Charger
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/charger/images/battery_fail.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/battery_fail.png \
    $(LOCAL_PATH)/charger/images/battery_scale.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/battery_scale.png \
    $(LOCAL_PATH)/charger/images/main_font.png:$(TARGET_COPY_OUT_ROOT)/res/images/charger/main_font.png \
    $(LOCAL_PATH)/charger/values/animation.txt:$(TARGET_COPY_OUT_ROOT)/res/values/charger/animation.txt

# Enable dynamic partition size
PRODUCT_USE_DYNAMIC_PARTITION_SIZE := true

# Ship plain APEXes, not compressed ones.
#
# Halium's mount-apexes.py mounts an APEX by loop-mounting the payload image
# inside it; a .capex has that image compressed, and the script rejects it with
# "Don't know how to handle ...". conscrypt, media and media.swcodec all arrive
# compressed by default on 16, so they silently never get mounted. 14 shipped
# everything uncompressed, which is why this never came up before.
PRODUCT_COMPRESSED_APEX := false

# VNDK
# An older vendor needs its own VNDK snapshot shipped beside the GSI's; they
# install to /system/system_ext/apex/com.android.vndk.v<N>. 32 is for the
# Android 12.1 vendors the Pixel 3a runs.
#
# No 30 here even though the 14 tree carried it: this tree only syncs
# prebuilts/vndk v31-v34, so Android 11 vendors cannot be served from a 16 GSI.
PRODUCT_EXTRA_VNDK_VERSIONS := 32 34

# init scripts
PRODUCT_PACKAGES += \
    init.disabled.rc \
    init.gsi.rc \
    init.halium.rc \
    vndk-detect \
    on-post-data.sh

# bind mount target for property overrides
PRODUCT_PACKAGES += \
    prop.halium

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# SPL fix
PRODUCT_PACKAGES += \
    getSPL

# Test tools
PRODUCT_PACKAGES += \
    bootctl \
    vintf

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# healthd for chargermode
PRODUCT_PACKAGES += \
    healthd

# fastbootd for recovery
PRODUCT_PACKAGES += \
    fastbootd

# Camera
PRODUCT_PACKAGES += \
    vendor.lineage.camera.motor@1.0
