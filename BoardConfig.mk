#
# Copyright (C) 2017-2020 The LineageOS Project
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

BOARD_VENDOR := halium

DEVICE_PATH := device/halium/halium_arm64

include build/make/target/board/generic_arm64_ab/BoardConfig.mk

TARGET_USES_64_BIT_BINDER := true

# APEX
TARGET_FLATTEN_APEX := true

# Platform
TARGET_BOARD_PLATFORM := halium

# Kernel
TARGET_NO_KERNEL := true

# Audio
USE_XML_AUDIO_POLICY_CONF := 1

# Bootloader
TARGET_NO_BOOTLOADER := true

# Display
TARGET_USES_HWC2 := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true

# HIDL
DEVICE_FRAMEWORK_MANIFEST_FILE := $(DEVICE_PATH)/framework_manifest.xml

# Partitions
TARGET_COPY_OUT_VENDOR := vendor
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_VENDORIMAGE_PARTITION_SIZE := 314572800
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

# Recovery
BOARD_USES_RECOVERY_AS_BOOT := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
