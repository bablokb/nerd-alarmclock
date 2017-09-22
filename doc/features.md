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
  - If brightness is zero pushing the "snooze"-button will show the display
    for two seconds (the 4-letter-pHat is still too bright at night, even at
    it's dimmest setting). (**new**)
  - Support four alarms
  - Every alarm is configurable
    * time
    * day(s) of the week
    * duration
    * snooze-delay (**new**)
    * type of light-alarm to show
    * type of display-alarm to show (e.g. some running text)
    * song/playlist to play (playlists also support internet-radio)
    * volume
    * fade-in time (from 0 to requested volume)
  - basic operation using four buttons
    * turn alarm on or off or stop a running alarm
    * cycle through display brightness
    * cycle through LED brightness
  - snooze a running alarm (i.e. stop it and restart it after a given delay).
    Can be implemented with a fifth  button or by redefining an existing button.
    (**new**)
  - detailed configuration using a telegram chat-bot
    * configure alarms
    * restart the clock
    * reboot or shutdown the system


Planned
-------

  - Put features currently only available from the bot additionally on
    push-buttons (e.g. restart/reboot/shutdown)
  - Add a web-interface to be independent from telegram
  - Add an IR-receiver and process commands from a remote-control
  - Support internet-radio (just for playing music, independent of alarms)
  - show metadata on the display
  - Add two knobs to select the radio-station and to adust volume
