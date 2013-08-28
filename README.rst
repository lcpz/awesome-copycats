===================
Awesome WM Copycats
=================== 

--------------------------------
Power themes for Awesome WM 3.5+ 
--------------------------------

:Author Luke Bonham <dada [at] archlinux [dot] info>
:License: BY-NC-SA_
:Version: 1.6.5
:Status: **Temporarily suspended**
:Reason: I'm focusing my work on vain_, which will play a big role in version 2.0

Description
==========

A set of power themes with the aim of making Awesome_ appearance awesome too!

Notable features
================

- Autohide widgets (*tell me only when you have to*)
- Autostart functionality
- Fast mpd and volume shortcuts (first time you see this trick in Awesome)
- Other fancy shortcuts for copying to the clipboard (goodbye clipboard managers!), toggle wiboxes, widgets popups, screenshots capture, moving clients
- Quake style dropdown terminal
- Calendar with current day highlighted and previous/next month switch with a click 
- Elegant notifications for new mails, current song, volume level, hdd critical state, low battery
- Yahoo Weather integration 
- Net carrier status notifier 
- Colorful autoupdating icons
- Symbolic tag names
- TXT layouts names (instead of icons)
- PNG taskbar
- Custom layouts
- No borders when there's only one visible client
- Powerful volume bar
- Freedesktop menu
- By direction client focus (like in bspwm)
- Nice client border (i.e. colors change along with process status)

They're scattered all over the set, so try each theme and choose the one you enjoy the most. 

Gallery
--------

**Multicolor** copycatted from tip_ [liked so much --> compulsory personal version]

.. image:: http://i.imgur.com/vBMn8C8.jpg

**Powerarrow Darker** copycatted from romockee_ [his one was stuck at v3.4]

.. image:: http://i.imgur.com/inRoOrg.png

**Steamburn** copycatted from ok100_ [it was so cool, but only for dwm]

.. image:: http://i.imgur.com/esHcVzj.jpg

**Blackburn** 

.. image:: http://dotshare.it/public/images/uploads/553.png 

**Dremora** 

.. image:: http://dotshare.it/public/images/uploads/589.png

**Rainbow** 

.. image:: http://i.imgur.com/Ae7hAsK.png

**Holo** suggested by amouly_

.. image:: http://dotshare.it/public/images/uploads/621.png

Notes
--------

**Do not** use without reading and modifying according to your preferences and system specs.

Widgets are provided by vicious_.

Fonts are Terminus (Multicolor, Powerarrow Darker) and Tamsyn (other ones).

Blackburn and Dremora use Icons_: **if you're running Debian/Ubuntu**, be sure to have bitmaps enabled (1_ 2_).

Except Multicolor and Powerarrow Darker, every theme has a colorscheme_ and uses Yawn_.

Blackburn and Holo use png topbars, supported screen widths are:

    1024
    1152
    1280
    1366
    1440
    1600
    1680
    1920
    2560

if your screen is unsupported, you have to create a proper topbar and put it into ``themes/$THEME/icons/topbar``. You can send me your custom sized bar, I'll add it.

Freedesktop menu in use is just an example: feel free to modify ``freedesktop/freedesktop.lua``.

If you happen to get an error involving ``/home fs widget``, replace every occurrence of ``/home`` with ``/``, or some other argument defined in vicious readme_, section ``vicious.widgets.fs``.

Instead, if you happen to get any ``surface.lua`` problem, be sure to have ``lua`` and ``lua-lgi`` up to date.

Also be sure to set your music dir in ``scripts/mpdinfo``, and to have ``imagemagick`` and ``notify-send`` installed.


**Have any suggestions?** Did you see some great stuff and you'd like me to put my paws on it? Then tell me! It might just be the next copycat.

.. _Awesome: http://awesome.naquadah.org/
.. _vain: https://github.com/copycat-killer/vain
.. _tip: http://theimmortalphoenix.deviantart.com/art/Full-Color-Awesome-340997258
.. _romockee: https://github.com/romockee/powerarrow-dark
.. _ok100: http://ok100.deviantart.com/art/DWM-January-2013-348656846
.. _amouly: https://bbs.archlinux.org/viewtopic.php?pid=1307158#p1307158
.. _vicious: http://git.sysphere.org/vicious/about/
.. _Icons: https://github.com/copycat-killer/dots/tree/master/.fonts
.. _Yawn: https://github.com/copycat-killer/yawn
.. _1: http://weiwu.sdf.org/100921.html
.. _2: https://wiki.ubuntu.com/Fonts#Enabling_Bitmapped_Fonts
.. _colorscheme: https://github.com/copycat-killer/dots/tree/master/.colors
.. _readme: http://git.sysphere.org/vicious/tree/README 
.. _BY-NC-SA: http://creativecommons.org/licenses/by-nc-sa/3.0/
