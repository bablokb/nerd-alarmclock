Keyboard Control
================

The keyboard has four keys. Each key has at most five functions,
a default function and up to four overloaded functions

To switch between the default function set and an overloaded function-set,
the respective button has to be pressed long (about a second should do).

Currently, only two sets of overloaded functions are defined, initiated
by button `1` and by button `2`.

Starting with version 2, the nerd-alarmclock supports a fifth button for
special actions, e.g. for snoozing an alarm (see below).

If you don't have a fifth button, you can redefine button-4 to take over
these functions (but you loose an alarm).


Default Functions
-----------------

Each of the buttons toggles the state of respective alarm, e.g. button `1`
controls `alarm1`:

| Button | function                 |
|--------|--------------------------|
| `1`    | toggle state of alarm 1  |
| `2`    | toggle state of alarm 2  |
| `3`    | toggle state of alarm 3  |
| `4`    | toggle state of alarm 4  |


State transistions:

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

The functions for buttons 3 and 4 are not implemented yet.

| Button | function                 |
|--------|--------------------------|
| `1`    | cycle LED brightness     |
| `2`    | cycle display brightness |
| `3`    | cycle LED modes          |
| `4`    | cycle display modes      |


Overloaded Functions (Set 2)
----------------------------

A long press of button `2` activates this set of overloaded functions.
A second long press will toggle back to the default functions.


| Button | function                 |
|--------|--------------------------|
| `1`    | restart the clock        |
| `2`    | reboot the system        |
| `3`    | shutdown the system      |
| `4`    | (no function assigned)   |


Snooze Button
-------------

Currently, the snooze-button operates as follows:

  - if no alarm is ringing and if the brightness of the display
    is currently turned off (e.g. during the night), pressing the button
    will show the display for two seconds
  - if an alarm is ringing, pressing the button will snooze the alarm
    for the configured snooze-time (turn it off and start it later again)
  - a long press of the button will turn on (or off) all LED thus using
    the LED-strip as a lamp
