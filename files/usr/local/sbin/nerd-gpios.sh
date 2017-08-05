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

gpio -g mode  4 tri
gpio -g mode 17 tri
gpio -g mode 22 tri
gpio -g mode 27 tri
