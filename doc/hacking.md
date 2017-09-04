Hacking-Guide
=============

Architecture
------------

The firmware for the alarmclock is implemented in python. The main program
is the script `/usr/local/sbin/nerd-alarmclock.py`, which is started by
the systemd-service defined in `/etc/systemd/system/nerd-alarmclock.service`.


The main script does not contain much logic. It mainly creates and loads
various object taking care of the hardware. All classes are submodules
of the `nclock`-module. During installation, the code is copied to
`/usr/local/lib/python2.7/site-packages/nclock`.

Logically, the software follows the [MVC paradigm](./nerdc-objects.png).
The model is implemented in the class `Settings`. The `LedController` and
`DisplayController` are views, and the `KeyboardThread` and `BotThread`
are the controllers.

Objects don't call methods directly, they only change attributes in
the `Settings`. They also register callbacks for attribut-changes
there and are called when the registered attribute changes.


Implementing new Hardware
-------------------------

As an example, we will walk through the implementation of a new hardware
component, which controlls a wall-plug. For this component we will need
a controller that acts as a *alarm-provider* (since we want to turn on
the plug on an alarm event).

So you need to implement and change the following code:

  1. Create a class `PlugController` in
     `/usr/local/lib/python2.7/site-packages/nclock/PlugController.py`
  2. Import the sub-module in
     `/usr/local/lib/python2.7/site-packages/nclock/__init__.py`
  3. Instantiate the `PlugController` in
     `/usr/local/sbin/nerd-alarmclock.py`

To act as an alarm-provider, the class must implement and register a method
which will provide an alarm-thread. You are free to choose a suitable name
for this method, but by convention it is named `get_alarm`. You can use an
existing controller (e.g. `SoundController`) as a template.

The `get_alarm`-method will return either `None` (no alarm configured), or
a thread. The thread in this case would just turn on the wall-plug.

Since this is a new component, there is no UI to configure the plug-alarm.
You either have to edit the settings.json file manually, or you have to
extend the `BotThread` or `WebThread`.
