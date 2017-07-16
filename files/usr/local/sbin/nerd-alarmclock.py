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

import nclock

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


# ---initialize objects   --------------------------------------------------

def init(parser):
  """ Initialize objects """

  settings = nclock.Settings.Settings(parser)
  settings.led_controller = nclock.LedController.LedController(settings)
  return settings

# --- start all threads   --------------------------------------------------

def start_threads(settings):
  """ Start all threads """
  
  threads = []
  timeKeeperThread = nclock.TimeKeeperThread.TimeKeeperThread(settings)
  threads.append(timeKeeperThread)
  
  keyboardThread = nclock.KeyboardThread.KeyboardThread(settings)
  threads.append(keyboardThread)

  if settings.get_value('BOT','active','0') != '0':
    botThread = nclock.BotThread.BotThread(settings)
    threads.append(botThread)

  map(threading.Thread.start, threads)
  return threads

# --- stop all threads   ---------------------------------------------------

def stop_threads(settings,threads):
  """ Stop all threads """

  # send event to all threads
  settings.stop_event.set()

  # wait for threads to terminate
  map(threading.Thread.join, threads)
  
  #for thread in threads:
  #  thread.stop()

# --------------------------------------------------------------------------

def signal_handler(_signo, _stack_frame):
  """ Signal-handler to cleanup threads """

  global threads, settings
  write_log("interrupt %d detected, exiting" % _signo)
  stop_threads(settings,threads)
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

# initialize system
settings = init(parser)

# create and start threads
threads = start_threads(settings)

# --- main loop   ---------------------------------------------------------

signal.pause()
