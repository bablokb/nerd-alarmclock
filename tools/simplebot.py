#!/usr/bin/python
# --------------------------------------------------------------------------
# Use this script to query your telgram-id (the from-ID). 
#
# Edit the script first and add the ID of your bot
#
#   bot = telepot.Bot('your-bot-id-here')
#
# Author: Bernhard Bablok
# License: GPL3
#
# Website: https://github.com/bablokb/nerd-alarmclock
#
# --------------------------------------------------------------------------

import signal
from pprint import pprint

import telepot
from telepot.loop import MessageLoop

# Initialisierung
bot = telepot.Bot('your-bot-id-here')
pprint(bot.getMe())

# process incoming messages
def handle(msg):
  pprint(msg)
  content_type, chat_type, chat_id = telepot.glance(msg)
  if content_type == 'text':
    bot.sendMessage(chat_id, "sorry, I don't understand '%s' yet!" % msg['text'])

# start Message-Loop in it's own thread
MessageLoop(bot, handle).run_as_thread()

# stop the program with CTRL-C
signal.pause()
