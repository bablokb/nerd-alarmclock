#!/bin/bash
# --------------------------------------------------------------------------
# PreExec script executed by systemd service nerd-alarmclock.service
#
# This script configures internal pullups/pulldowns for the used gpios
#
# Author: Bernhard Bablok
# License: GPL3
#
# Website: https://github.com/bablokb/nerd-alarmclock
#
# --------------------------------------------------------------------------

gpio -g mode  4 tri    # BTN2
gpio -g mode 12 up     # EK1_SW
gpio -g mode 16 up     # EK2_SW
gpio -g mode 17 tri    # BTN1
gpio -g mode 22 tri    # BTN3
gpio -g mode 25 down   # SNZ
gpio -g mode 27 tri    # BTN4
