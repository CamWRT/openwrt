#!/bin/sh
# Copyright (C) 2014 OpenWrt.org

. /lib/functions/leds.sh
. /lib/davinci.sh

get_status_led() {
	case $(davinci_board_name) in
	TS38F2)
		status_led="ts38f2:red:status"
		;;
	*)
		status_led=$(cd /sys/class/leds && ls -1d *:status 2> /dev/null | head -n 1)
		;;
	esac
}

set_state() {
	get_status_led

	case "$1" in
	preinit)
		status_led_blink_preinit
		;;
	failsafe)
		status_led_blink_failsafe
		;;
	preinit_regular)
		status_led_blink_preinit_regular
		;;
	done)
		status_led_set_heartbeat
		;;
	esac
}
