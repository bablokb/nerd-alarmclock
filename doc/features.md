Features
========

Implemented
-----------

  - Display the current time on the display
  - Show the day of the month on the LED-strip (using colors and number of LEDs)
  - Update time automatically from RTC and/or internet time-servers
  - Brightness of the display and the LED strip is configurable
    (off and four levels)
  - Brightness independently configurable for "day" and for "night" with
    automatic switching
  - Support four alarms
  - Every alarm is configurable
    * time
    * day(s) of the week
    * duration
    * type of light-alarm to show
    * type of display-alarm to show (e.g. some running text)
    * song to play
    * volume
    * fade-in time (from 0 to requested volume)
  - basic operation using four buttons
    * turn alarm on or off or stop a running alarm
    * cycle through display brightness
    * cycle through LED brightness
  - detailed configuration using a telegram chat-bot
    * configure alarms
    * restart the clock
    * reboot or shutdown the system


Planned
-------

  - Put features currently only available from the bot additionally on
    push-buttons (e.g. restart/reboot/shutdown)
  - Add a web-interface to be independent from telegram
  - Add a snooze-button (for snooze and other special functions)
  - Add an IR-receiver and process commands from a remote-control
  - Support internet-radio (for alarms and just for playing music)
  - Add a knob to adust volume
  