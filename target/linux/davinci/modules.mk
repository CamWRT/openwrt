#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

define KernelPackage/mmc-davinci
  SUBMENU:=$(OTHER_MENU)
  TITLE:=MMC/SD Card Support on TI DaVinci
  DEPENDS:=@TARGET_davinci +kmod-mmc
  KCONFIG:=CONFIG_MMC_DAVINCI
  FILES:=$(LINUX_DIR)/drivers/mmc/host/davinci_mmc.ko
  AUTOLOAD:=$(call AutoLoad,90,davinci_mmc,1)
endef

define KernelPackage/mmc-davinci/description
 Kernel support for MMC/SD cards on the TI DaVinci target
endef

$(eval $(call KernelPackage,mmc-davinci))

define KernelPackage/rtc-davinci
  SUBMENU:=$(OTHER_MENU)
  TITLE:=TI DaVinci SoC built-in RTC support
  DEPENDS:=@TARGET_davinci
  $(call AddDepends/rtc)
  KCONFIG:= \
	CONFIG_RTC_CLASS=y \
	CONFIG_RTC_DRV_DAVINCI=m
  FILES:=$(LINUX_DIR)/drivers/rtc/rtc-davinci.ko
  AUTOLOAD:=$(call AutoLoad,50,rtc-davinci)
endef

$(eval $(call KernelPackage,rtc-davinci))


I2C_DAVINCI_MODULES:= \
  CONFIG_I2C_DAVINCI:drivers/i2c/busses/i2c-davinci

define KernelPackage/i2c-davinci
  $(call i2c_defaults,$(I2C_DAVINCI_MODULES),55)
  TITLE:=TI DaVinci I2C driver
  DEPENDS:=@TARGET_davinci +kmod-i2c-core
endef

define KernelPackage/i2c-davinci/description
  Kernel module for TI DaVinci I2C controller
endef

$(eval $(call KernelPackage,i2c-davinci))
