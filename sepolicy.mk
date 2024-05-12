#
# This policy configuration will be used by all products that
# inherit from ArsenalsOs
#

ifeq ($(TARGET_COPY_OUT_VENDOR), vendor)
ifeq ($(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE),)
TARGET_USES_PREBUILT_VENDOR_SEPOLICY ?= true
endif
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
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/arsenals/sepolicy/dynamic \
    device/arsenals/sepolicy/vendor
endif
