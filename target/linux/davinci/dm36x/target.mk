BOARDNAME:=TI DaVinci DM36x (ARMv5)
FEATURES += squashfs nand
CPU_TYPE:=arm926ej-s

DEFAULT_PACKAGES += kmod-leds-gpio kmod-ledtrig-heartbeat

define Target/Description
	Build firmware images for TI DM365/DM368 based boards.
endef
