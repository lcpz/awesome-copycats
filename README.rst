===================
Awesome WM Copycats
===================

--------------------------------
Power themes for Awesome WM 3.5+
--------------------------------

:Author: Luke Bonham <dada [at] archlinux [dot] info>
:Version: 2.0-git
:License: BY-NC-SA_
:Source: https://github.com/copycat-killer/awesome-copycats

Description
==========

A set of themes with the aim of making Awesome_ appearance awesome too!

Notable features
================

- Shadow widgets (*tell me only when you have to*)
- Autostart functionality
- Fast mpd and volume shortcuts (first time you see this trick in Awesome)
- Other shortcuts for copying to the clipboard (goodbye clipboard managers!), toggle wiboxes, widgets popups, screenshots capture, moving clients
- Quake style dropdown terminal
- Calendar with current day highlighted and months switch with a click
- Elegant notifications for new mails, current song, volume level, hdd critical state, low battery
- Yahoo! Weather integration
- Net carrier status notifier
- Colorful autoupdating icons
- Symbolic tag names
- TXT layoutbox
- PNG wibox bar
- Custom layouts
- No borders when there's only one visible client
- Powerful volume bar
- Freedesktop menu
- Vi-like client focus
- Nice client border (colors change along with process status)
- Non-empty tag browsing

Gallery
=======

**Multicolor** copycatted from tip_

.. image:: http://dotshare.it/public/images/uploads/650.png

**Powerarrow Darker** copycatted from romockee_ [port from v3.4]

.. image:: http://dotshare.it/public/images/uploads/649.png

**Steamburn** copycatted from ok100_ [port from dwm]

.. image:: http://dotshare.it/public/images/uploads/648.png

**Blackburn**

.. image:: http://dotshare.it/public/images/uploads/553.png

**Dremora**

.. image:: http://dotshare.it/public/images/uploads/589.png

**Rainbow**

.. image:: http://dotshare.it/public/images/uploads/606.png

**Holo** suggested by amouly_

.. image:: http://dotshare.it/public/images/uploads/621.png

Installation
============

::
    git clone https://github.com/copycat-killer/awesome-copycats.git
    mv -u awesome-copycats ~/.config/awesome
    cd ~/.config/awesome/lain
    git submodule init
    git submodule update

But first you may want to do this: ::

    cp -ar ~/.config/awesome ~/.config/awesome.save

Usage
=====

::
    cd ~/.config/awesome
    cp rc.lua rc.lua.save
    cp rc.lua.mytheme rc.lua

Notes
=====

**Do not use** without setting your preferences and system specs first.

Complements are provided by lain_.

Fonts are Terminus_ (Multicolor, Powerarrow Darker) and Tamsyn_ (other ones).

Every theme has a colorscheme_.

Blackburn and Dremora use Icons_, be sure to have bitmaps enabled if running under Debian_ or Ubuntu_.

.. _BY-NC-SA: http://creativecommons.org/licenses/by-nc-sa/3.0/
.. _Awesome: http://awesome.naquadah.org/
.. _tip: http://theimmortalphoenix.deviantart.com/art/Full-Color-Awesome-340997258
.. _romockee: https://github.com/romockee/powerarrow-dark
.. _ok100: http://ok100.deviantart.com/art/DWM-January-2013-348656846
.. _amouly: https://bbs.archlinux.org/viewtopic.php?pid=1307158#p1307158
.. _lain: https://github.com/copycat-killer/vain
.. _Terminus: http://terminus-font.sourceforge.net/
.. _Tamsyn: http://www.fial.com/~scott/tamsyn-font/
.. _colorscheme: https://github.com/copycat-killer/dots/tree/master/.colors
.. _Icons: https://github.com/copycat-killer/dots/tree/master/.fonts
.. _Debian: http://weiwu.sdf.org/100921.html
.. _Ubuntu: https://wiki.ubuntu.com/Fonts#Enabling_Bitmapped_Fonts
