# --------------------------------------------------------------------------
# Makefile for i18n-files
#
# Author: Bernhard Bablok
# License: GPL3
#
# Website: https://github.com/bablokb/nerd-alarmclock
#
# --------------------------------------------------------------------------

I18N_TOOL_DIR := /usr/share/doc/packages/python/Tools/i18n
NCLOCK_DIR    := files/usr/local/lib/python2.7/site-packages/nclock

# targets ---------------------------------------------------------------------

default:
	@echo "   make pot creates template file i18n/en.pot"
	@echo "   make ger creates German po-file"

pot:
	python $(I18N_TOOL_DIR)/pygettext.py -d en -o i18n/en.pot \
		$(NCLOCK_DIR)/BotThread.py

ger:
	python $(I18N_TOOL_DIR)/msgfmt.py \
		-o $(NCLOCK_DIR)/locale/de/LC_MESSAGES/nclock.mo i18n/de.po
