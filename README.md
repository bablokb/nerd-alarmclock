nerd-alarmclock
===============

A Pi-Zero W based alarm-clock for nerds with many unique functions:

 - wake-up light (using Pimoroni's *Blinkt!*)
 - clock display (using Pimoroni's *Four Letter pHat*)
 - play sounds or internet radio
 - use a chat-bot for configuration

See the alarm-clock in a prototype housing: ![](doc/prototype.jpg "Alarm-Clock in a prototype housing").

Table of Contents
-----------------

  1. [News and Status](#news "News")
  2. [Installation](#install "Installation")
  3. [Hardware](#hardware "Hardware")
  4. [Prerequisites](#prerequisites "Prerequisites")
  5. [Configuration](#configuration "Configuration")
  6. [Usage](#usage "Usage")
  7. [Hacking](#Hacking "Hacking")


News
----

The software is almost finished, the documentation is still work in progress.
A detailed list of functions (current and planned) is available in the
document [Features](doc/features.md "Features").

### Version 1 /  Sept, 2017 ###

First productive version (planned).


Prerequisites
-------------

Besides the hardware-modules listed in section [Hardware](#hardware "Hardware")
and the software-environment described in
[Installation](#install "Installation") there are no special prerequisites
with the exception of a telegram ID and your own telegram-bot.
If you don't want to use telegram you either have to configure the alarms
using ssh, or wait for the yet to come web-interface.

Registering with telegram is easy, just download the messenger and follow
the instructions. After that, start a chat with @BotFather and this chatbot
will lead you through the process of defining your own bot.


Hardware
--------

From hardware-side, you need

  - a Pi with internet access (a Pi-Zero-W will do fine)
  - the [LED-strip *Blinkt!* from Pimoroni](https://shop.pimoroni.com/products/blinkt "Blinkt!")
  - the [segment-display *Four Letter pHat*](https://shop.pimoroni.com/products/four-letter-phat "Four-Letter-pHat")
    from the same manufacturer
  - four buttons, e.g. a cheap [4-key keypad](doc/keypad.jpg) available
    from ebay or Amazon marketplace.
  - a real-time-clock (DS3231, optional)
  - jumper cable or an extension board
    (e.g. a [Mini Black HAT Hack3r](https://shop.pimoroni.com/products/mini-black-hat-hack3r "Extension board"))

Since you need the GPIOs for both hardware extensions, you cannot just
plug in the LED-strip or the hat on the Pi. You can either
connect the components using
[some jumper cables](doc/assembly.jpg "Assembly"), or you use an extension board.
When using jumper cables, observe use the pinout provided by
[https://pinout.xyz](https://pinout.xyz "Pinout"). The pins are also
documented [here](doc/pins.md "Pins").


Installation
------------

As a prerequisite, you need a basic install of Raspbian Jessie-Lite. It
probably also works with Stretch-Lite, but this is untested yet.

Use the following commands to install the software:

    git clone https://github.com/bablokb/nerd-alarmclock.git
    cd nerd-alarmclock
    sudo tools/install
    cd ..
    git clone https://github.com/bablokb/gpio-poll-service.git
    cd gpio-poll-service
    sudo tools/install

This will pull-in all dependencies, install the software, create technical
users and do a basic configuration of the system. Since the install command
changes the file `/boot/config.txt`, you need a reboot to activate the changes.

Note that the installation of the gpio-poll-service will ask you to configure
the service (file `/etc/gpio-poll.conf`), but this project already
provides a suitable configuration file.


Configuration
-------------

### System services ###

Edit the file `/etc/nerd-alarmclock.conf` to configure the systemd-service
running the clock. In this file, you at least have to edit the section
`[BOT]` and enter your own user-id and the id of your bot. The latter is
provided by *BotFather*. To query your own id, edit the python-script
`tools/simplebot.py`, start it and exchange some messages with the bot.
The script will print all messages and you will find your own id in the
messages (extract the "from-id").


### Bot configuration ###

The bot of the alarmclock uses a predefined set of commands. You should
register the following commands for your bot with *BotFather*:

| Command | Description |
| --- | --- |
| `/alarm` | Configure alarms |
| `/restart` | Restart the clock |
| `/reboot` | Reboot the system |
| `/shutdown` | Shutdown the system |
| `/start` | Start a dialog with the bot |
| `/help` | Provide help |
| `/settings` | Show settings |

This is not strictly necessary, but it greatly simplifies interaction with
the bot.


### Adding sounds ###

To play music or sounds during an alarm, you have to add the files
to the directory `/var/lib/nerd-clock/sounds`. The nerd-alarmclock uses
the program `mpg123` to play the files, so all formats supported by mpg123
should be fine. If you want to play an internet-radio station, add the url
to a file with the extension `m3u` (playlist). Note that mpg123 does not
support nested playlists.


### Manual configuration ###

Program defaults are in the file `/var/lib/nerd-alarmclock/defaults.json`.
You should not edit this file directly (unless you know what you are
doing). After first run, the settings are saved in
`/var/lib/nerd-alarmclock/settings.json`. You can edit this file
manually, but you should make sure the clock-service is stopped before
doing so (it will be otherwise overwritten).

There are still some settings which you typically only change very
seldomly and these settings are not exposed by the config-interface of the
bot, so you have to change the manually:

  - **day.start**: start of day-mode (e.g. brightness depends on this)
  - **day.end**:   end   of day-mode (e.g. brightness depends on this)
  - some special options to tweak the alarms


Usage
-----

After initial configuration as explained above, restart the system and then
it should just run. Use the bot to configure alarms and the buttons to
enable or disable the alarms. See [keyboard usage](doc/keyboard.md
"Keyboard Usage") for details about the behaviour of the buttons.


Hacking
-------

If you want to change the code and adapt it for your needs, you need some
python know-how and you have to understand the structure of the program.
For details read the [hacking-guide](doc/hacking.md "Hacking-Guide").
