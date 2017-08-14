Keyboard Control
================

The keyboard has four keys. Each key has two of functions, a default
function and an overloaded function.

To switch between the default function and the overloaded function,
the button `1` has to be pressed long (about a second should do).

Technically it is no problem to add an additional set of overloaded
functions for every long button press, but currently this is only implemented
for button 1.


Default Functions
-----------------

Each of the buttons toggles the state of respective alarm, e.g. button `1`
controls `alarm1`:


| old state | new state |
|-----------|-----------|
| disabled  | enabled   |
| enabled   | disabled  |
| ringing   | enabled   |


Overloaded Functions
--------------------

A long press of button `1` activates the overloaded functions. A second long
press will toggle back to the default functions. The functions for buttons
3 and 4 are not implemented yet.


| Button | function                 |
|--------|--------------------------|
| `1`    | cycle LED brightness     |
| `2`    | cycle display brightness |
| `3`    | cycle LED modes          |
| `4`    | cycle display modes      |

