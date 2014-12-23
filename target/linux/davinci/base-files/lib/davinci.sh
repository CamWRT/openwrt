#!/bin/sh
#
# Copyright (C) 2014 OpenWrt.org
#

DAVINCI_BOARD_NAME=
DAVINCI_MODEL=

davinci_board_detect() {
	local machine
	local name

	machine=$(awk 'BEGIN{FS="[ \t]+:[ \t]"} /Hardware/ {print $2}' /proc/cpuinfo)

	case "$machine" in
	*"TS38F2")
		name="TS38F2"
		;;
	esac

	[ -z "$name" ] && name="unknown"

	[ -z "$DAVINCI_BOARD_NAME" ] && DAVINCI_BOARD_NAME="$name"
	[ -z "$DAVINCI_MODEL" ] && DAVINCI_MODEL="$machine"

	[ -e "/tmp/sysinfo/" ] || mkdir -p "/tmp/sysinfo/"

	echo "$DAVINCI_BOARD_NAME" > /tmp/sysinfo/board_name
	echo "$DAVINCI_MODEL" > /tmp/sysinfo/model
}

davinci_board_name() {
	local name

	[ -f /tmp/sysinfo/board_name ] && name=$(cat /tmp/sysinfo/board_name)
	[ -z "$name" ] && name="unknown"

	echo "$name"
}
