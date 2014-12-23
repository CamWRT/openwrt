#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

JFFS2_BLOCKSIZE = 64k 128k 256k
KDIR_TMP:=$(KDIR)/tmp

define Image/BuildKernel
	$(CP) $(LINUX_DIR)/arch/arm/boot/zImage $(BIN_DIR)/$(IMG_PREFIX)-$(PROFILE)-zImage
	$(call Image/BuildKernel/MkuImage, \
		none, 0x80008000, 0x80008000, \
		$(BIN_DIR)/$(IMG_PREFIX)-$(PROFILE)-zImage, \
		$(KDIR)/$(IMG_PREFIX)-$(PROFILE)-uImage, \
	)
	dd if=$(KDIR)/$(IMG_PREFIX)-$(PROFILE)-uImage \
		of=$(BIN_DIR)/$(IMG_PREFIX)-$(PROFILE)-uImage \
		bs=128k conv=sync

ifneq (,$(wildcard ./install-$(PROFILE).scr))
	grep -ve '^#' ./install-$(PROFILE).scr > $(KDIR)/install-$(PROFILE).scr
	mkimage -A arm -O u-boot -T script -C none -n "OpenWRT Installer for $(PROFILE)" \
		-d $(KDIR)/install-$(PROFILE).scr $(BIN_DIR)/$(IMG_PREFIX)-$(PROFILE)-install.uscr
endif
endef

define Image/InstallKernel
	true
endef

define Image/Build/squashfs
	$(call prepare_generic_squashfs,$(KDIR)/root.$(1))
	$(call Image/Build/UbinizeImage,$(PROFILE),,squashfs,$($(PROFILE)_UBI_OPTS))
	$(call Image/Build/SysupgradeNAND,$(PROFILE),$(1),$(BIN_DIR)/$(IMG_PREFIX)-$(PROFILE)-uImage)
endef

define Image/Build
	$(call Image/Build/$(1),$(1))
endef

$(eval $(call BuildImage))
