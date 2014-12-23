#
# Copyright (C) 2014 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/TS38F2
  NAME:=Topsee TS38F2 IP camera module
  PACKAGES+=
endef

define Profile/TS38F2/Description
	Topsee TS38F2 IP camera module
endef

TS38F2_UBI_OPTS:="-m 2048 -p 128KiB -s 2048"

$(eval $(call Profile,TS38F2))
