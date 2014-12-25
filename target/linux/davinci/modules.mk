#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.

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
