#
# This policy configuration will be used by all products that
# inherit from ArsenalsOs
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
endif

ifneq (,$(filter msm8960 msm8226 msm8610 msm8974 apq8084 msm8909 msm8916 msm8952 msm8992 msm8994 msm8937 msm8953 msm8996 msm8998 sdm660 sdm710 sdm845, $(TARGET_BOARD_PLATFORM)))
USE_SYSTEM_SEPOLICY_INSTEAD_VENDOR = true
endif

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    device/arsenals/sepolicy/public

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/arsenals/sepolicy/private

ifeq ($(TARGET_USES_PREBUILT_VENDOR_SEPOLICY), true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    device/arsenals/sepolicy/dynamic \
    device/arsenals/sepolicy/system
else
ifeq ($(USE_SYSTEM_SEPOLICY_INSTEAD_VENDOR), true)
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/arsenals/sepolicy/dynamic \
    device/arsenals/sepolicy/system
else
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/arsenals/sepolicy/dynamic \
    device/arsenals/sepolicy/vendor
endif
endif
