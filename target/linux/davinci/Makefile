#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=davinci
BOARDNAME:=TI DaVinci
FEATURES:=targz rtc gpio
SUBTARGETS:=dm36x

MAINTAINER:=Vladimir Ermakov <vooon341@gmail.com>
KERNEL_PATCHVER:=3.18

include $(INCLUDE_DIR)/target.mk

$(eval $(call BuildTarget))
