#!/usr/bin/python
# --------------------------------------------------------------------------
# Script executed by systemd service nerd-alarmclock.service
#
# Please edit /etc/nerd-alarmclock.conf to configure this script.
#
# Author: Bernhard Bablok
# License: GPL3
#
# Website: https://github.com/bablokb/nerd-alarmclock
#
# --------------------------------------------------------------------------

import select, os, sys, syslog, signal, time
import ConfigParser, threading

from nclock import BotThread

# --- helper functions   ---------------------------------------------------

# --------------------------------------------------------------------------

def write_log(msg):
  """ write message to the system log """
  
  global debug
  if debug == '1':
    syslog.syslog(msg)

# --------------------------------------------------------------------------


# --------------------------------------------------------------------------


# --------------------------------------------------------------------------


# --------------------------------------------------------------------------


# --------------------------------------------------------------------------

def start_threads(parser):
  """ start all threads """
  
  threads = []
  stopEvent = threading.Event()
  threads.append(stopEvent)
  
  botThread = BotThread.BotThread(parser,stopEvent)
  botThread.start()
  threads.append(botThread)
  return threads

# --------------------------------------------------------------------------

def stop_threads(threads):
  """ stop all threads """

  # send event to all threads
  threads[0].set()

  # wait for threads to terminate
  map(threading.Thread.join, threads[1:])
  
  #for thread in threads[1:]:
  #  thread.stop()

# --------------------------------------------------------------------------

def signal_handler(_signo, _stack_frame):
  """ signal-handler to cleanup threads """

  global threads
  write_log("interrupt %d detected, exiting" % _signo)
  stop_threads(threads)
  sys.exit(0)

# --- main program   ------------------------------------------------------

debug='0'
syslog.openlog("nerd-alarmclock")
parser = ConfigParser.RawConfigParser()

# read configuration
parser.read('/etc/nerd-alarmclock.conf')

# setup signal handlers
signal.signal(signal.SIGTERM, signal_handler)
signal.signal(signal.SIGINT, signal_handler)

# create and start threads
threads = start_threads(parser)

# --- main loop   ---------------------------------------------------------

signal.pause()
