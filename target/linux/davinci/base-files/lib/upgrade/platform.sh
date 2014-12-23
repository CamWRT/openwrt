#
# Copyright (C) 2014 OpenWrt.org
#

. /lib/davinci.sh

RAMFS_COPY_DATA=/lib/davinci.sh

platform_check_image() {
	local board=$(davinci_board_name)

	[ "$ARGC" -gt 1 ] && return 1

	nand_do_platform_check $board $1
	return $?
}

# use default platform_do_upgrade()

disable_watchdog() {
	killall watchdog
	( ps | grep -v 'grep' | grep '/dev/watchdog' ) && {
		echo 'Could not disable watchdog'
		return 1
	}
}

append sysupgrade_pre_upgrade disable_watchdog
