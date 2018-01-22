Features
========

Implemented
-----------

  - Display the current time on the display
  - Show the day of the month on the LED-strip (using colors and number of LEDs)
  - Use the LED-strip as a lamp (**new**)
  - Play internet radio (**since v2**)
  - Update time automatically from RTC and/or internet time-servers
  - Brightness of the display and the LED strip is configurable
    (off and four levels)
  - Brightness independently configurable for "day" and for "night" with
    automatic switching
  - If brightness is zero pushing the "snooze"-button will show the display
    for two seconds (the 4-letter-pHat is still too bright at night, even at
    it's dimmest setting). (**since v2**)
  - Support four alarms
  - Every alarm is configurable
    * time
    * day(s) of the week
    * duration
    * delay for light or sound (e.g. sound will start 2 minutes after light
      or vica-versa) (**new**)
    * snooze-time (**since v2**)
    * type of light-alarm to show
    * type of display-alarm to show (e.g. some running text)
    * song/playlist to play (playlists also support internet-radio)
    * volume
    * fade-in time (from 0 to requested volume)
  - basic operation using four buttons
    * turn alarm on or off or stop a running alarm
    * cycle through display brightness
    * cycle through LED brightness
  - Control internet radio using two encoder-knobs (**since v2**)
    * on/off and set volume
    * cycle through channel-lists and cycle through stations (within list)
  - snooze a running alarm (i.e. stop it and restart it after a given delay).
    Can be implemented with a fifth  button or by redefining an existing button.
    (**since v2**)
  - use an IR-remote to control the alarm-clock and radio (**new**)
  - detailed configuration using a telegram chat-bot
    * configure alarms
    * restart the clock
    * reboot or shutdown the system
  - Restart/Reboot/Shutdown available from push-button (**since v2**)


Planned
-------

  - Add a web-interface to be independent from telegram
  - show metadata on the display
