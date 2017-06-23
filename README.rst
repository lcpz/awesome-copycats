Awesome WM Copycats
===================

---------------------------
Themes for Awesome WM 3.5.x
---------------------------

:Author: Luke Bonham <dada [at] archlinux [dot] info>
:Version: git
:License: BY-NC-SA_
:Source: https://github.com/copycat-killer/awesome-copycats

Description
===========

A set of themes for the Awesome_ window manager.

Features
========

- Modularity
- Autohide widgets
- Autostart windowless processes
- Fast MPD and volume shortcuts (first time this trick has been used in Awesome)
- Shortcuts for copying to the clipboard (no need for clipboard managers), toggle wiboxes, widgets popups, screenshots capture, moving and magnifying clients
- Quake drop-down terminal
- Calendar with current day highlighted and months switch with a click/scroll
- Notifications for new mails, current song, volume level, hdd critical state, low battery
- OpenWeatherMap integration
- Net carrier status notifier
- Symbolic tag names
- DWM-like textual layoutbox
- Cairo wibar
- Custom layouts
- No borders when there's only one visible client
- Freedesktop.org compliant menu and desktop icons
- Vi-like client focus
- Non-empty tag browsing
- On-the-fly useless gaps resize
- Dynamic tagging

Gallery
=======

**Multicolor**, inspired by lucamanni_

.. image:: http://dotshare.it/public/images/uploads/650.png

**Powerarrow**, porting of romockee_'s

.. image:: http://dotshare.it/public/images/uploads/1453.png

**Powerarrow Dark**

.. image:: http://dotshare.it/public/images/uploads/649.jpg

**Steamburn**, porting of ok100_'s dwm

.. image:: http://dotshare.it/public/images/uploads/648.png

**Blackburn**

.. image:: http://dotshare.it/public/images/uploads/553.png

**Dremora**

.. image:: http://dotshare.it/public/images/uploads/652.png

**Rainbow**

.. image:: http://dotshare.it/public/images/uploads/606.png

**Holo**, requested by amouly_

.. image:: http://dotshare.it/public/images/uploads/651.jpg

**Copland**, inspired by foozer_

.. image:: http://dotshare.it/public/images/uploads/655.png

Installation
============

.. code-block:: shell

    $ git clone --recursive https://github.com/copycat-killer/awesome-copycats.git
    $ mv -bv awesome-copycats/* ~/.config/awesome; rm -r awesome-copycats

Usage
=====

Switch a theme this way: ::

    $ cd ~/.config/awesome
    $ cp rc.lua.theme rc.lua

Alternatively, you can use `switch-theme.sh`_, which will also update to the latest commit.

Then, customize your ``rc.lua`` and restart Awesome (``Mod4 + ctrl + r``).

Notes
=====

Complements are provided by lain_ and freedesktop_.

Fonts are Terminus_ (Multicolor, Powerarrow Darker), Tamzen_ (Copland), Roboto_ (Holo) and Tamsyn_ (other ones).

Every theme has a colorscheme_.

Blackburn and Dremora use Icons_: be sure to have bitmaps enabled if running under Debian or Ubuntu_.

Additional software used: ::

    unclutter firefox scrot mpd mpc dmenu xsel

.. _BY-NC-SA: http://creativecommons.org/licenses/by-nc-sa/4.0
.. _Awesome: http://github.com/awesomeWM/awesome
.. _lucamanni: https://github.com/lucamanni/awesome
.. _romockee: https://github.com/romockee/powerarrow
.. _ok100: http://ok100.deviantart.com/art/DWM-January-2013-348656846
.. _amouly: https://bbs.archlinux.org/viewtopic.php?pid=1307158#p1307158
.. _foozer: http://dotshare.it/dots/499
.. _lain: https://github.com/copycat-killer/lain
.. _freedesktop: https://github.com/copycat-killer/freedesktop
.. _Terminus: http://terminus-font.sourceforge.net
.. _Tamzen: https://github.com/sunaku/tamzen-font
.. _Roboto: https://fonts.google.com/specimen/Roboto
.. _Tamsyn: http://www.fial.com/~scott/tamsyn-font
.. _colorscheme: https://github.com/copycat-killer/dots/tree/master/.colors
.. _Icons: https://github.com/copycat-killer/dots/tree/master/.fonts
.. _Ubuntu: https://wiki.ubuntu.com/Fonts#Enabling_Bitmapped_Fonts
