Keyboard Control
================

The number of buttons you can use depends on your physical setup. The default
setup uses four standard buttons and a fifth button for special actions, e.g.
for snoozing an alarm (see below). If you don't have a fifth button, you
can redefine button-4 to take over these functions (but you loose an alarm).

Each of the buttons supports a short-press and a long-press. The default
function mapped to the short-press is the control of the alarm. A long
press will do something different, e.g. map a different set of functions
to all keys. 


Default Functions
-----------------

Each of the buttons toggles the state of respective alarm, e.g. button `1`
controls `alarm1`:

| Button | short-press function     | long-press function               |
|--------|--------------------------|-----------------------------------|
| `1`    | toggle state of alarm 1  | load overloaded functions (set 1) |
| `2`    | toggle state of alarm 2  | load overloaded functions (set 2) |
| `3`    | toggle state of alarm 3  |                                   |
| `4`    | toggle state of alarm 4  | toggle lights-off mode            |
| `SNZ`  | snooze / show display    | toggle lamp                       |

State transistions for alarms:

| old state | new state |
|-----------|-----------|
| disabled  | enabled   |
| enabled   | disabled  |
| ringing   | enabled   |
| snooze    | enabled   |


Overloaded Functions (Set 1)
----------------------------

A long press of button `1` activates this set of overloaded functions.
A second long press will toggle back to the default functions.


| Button | short-press function                      |
|--------|-------------------------------------------|
| `1`    | cycle LED brightness                      |
| `2`    | cycle display brightness                  |
| `3`    | cycle LED modes                           |
| `4`    | cycle display modes (not implemented yet) |


Overloaded Functions (Set 2)
----------------------------

A long press of button `2` activates this set of overloaded functions.
A second long press will toggle back to the default functions.


| Button | short-press function     |
|--------|--------------------------|
| `1`    | restart the clock        |
| `2`    | reboot the system        |
| `3`    | shutdown the system      |
| `4`    |                          |


Snooze Button
-------------

Currently, the snooze-button operates as follows:

  - if no alarm is ringing and if the brightness of the display
    is currently turned off (e.g. during the night), pressing the button
    will show the display for two seconds
  - if an alarm is ringing, pressing the button will snooze the alarm
    for the configured snooze-time (turn it off and start it later again)
  - a long press of the button will turn on (or off) all LEDs thus using
    the LED-strip as a lamp
