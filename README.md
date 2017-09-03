nerd-alarmclock
===============

A Pi-Zero W based alarm-clock for nerds with many unique functions:

 - wake-up light (using Pimoroni's *Blinkt!*)
 - clock display (using Pimoroni's *Four Letter pHat*)
 - play sounds or internet radio
 - use a chat-bot for configuration


Table of Contents
-----------------

  1 [News and Status](#news "News")
  2 [Installation](#install "Installation")
  2 [Hardware](#hardware "Hardware")
  2 [Prerequisites](#prerequisites "Prerequisites")
  3 [Configuration](#configuration "Configuration")


News
----

The software is almost finished, the documentation is still work in progress.
A detailed list of functions (current and planned) is available in the
document [Functionality](doc/functions.md "Functionality").

### Version 1 /  Sept, 2017 ###

First productive version (planned).


Prerequisites
-------------

Besides the hardware-modules listed in section [Hardware](# hardware "Hardware")
and the software-environment described in
[Installation](# install "Installation") there are no special prerequisites
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
  - the [LED-strip *Blinkt!* from Pimoroni](doc/blinkt.jpg "Blinkt!")
  - the
    [segment-display *Four Letter pHat*](doc/4letterhat.jpg "Four-Letter-pHat")
    from the same manufacturer
  - four buttons, e.g. a  cheap [4-key keypad](doc/keypad.jpg) available
    from ebay or Amazon marketplace.
  - a real-time-clock (DS3231, optional)
  - jumper cable or an extension board
    (e.g. a [Mini Black HAT Hack3r](doc/board.jpg "Extension board")

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


Configuration
-------------

### System services ###

Edit the file `/etc/nerd-alarmclock.conf` to configure the systemd-service
running the clock. In this file, you at least have to edit the section
`[BOT]` and enter your own user-id and the id of your bot.