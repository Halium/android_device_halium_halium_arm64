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

# Ramdisk
BOARD_ROOT_EXTRA_FOLDERS += efs

# Offline charging
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_HEALTHD_CUSTOM_CHARGER_RES := $(DEVICE_PATH)/charger/images

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)
