#!/bin/sh

do_davinci() {
	. /lib/davinci.sh

	davinci_board_detect
}

boot_hook_add preinit_main do_davinci
