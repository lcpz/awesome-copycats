Awesome WM Copycats
===================

-------------------------
Themes for Awesome WM 4.x
-------------------------

:Author: Luke Bonham <dada [at] archlinux [dot] info>
:Version: git
:License: BY-NC-SA_
:Source: https://github.com/copycat-killer/awesome-copycats

Description
===========

A set of themes for the Awesome_ window manager, version >= 4.0.

See branches_ for previous versions.

Features
========

- Modularity
- Autohide widgets
- Autostart windowless processes
- Fast MPD and volume shortcuts (first time this trick has been used in Awesome)
- Shortcuts for copying to the clipboard, toggle wiboxes, widgets popups, screenshots capture, moving and magnifying clients
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

**Vertex**, requested by swordfischer_

.. image:: http://dotshare.it/public/images/uploads/1432.jpg

Installation
============

.. code-block:: shell

    $ git clone --recursive https://github.com/copycat-killer/awesome-copycats.git
    $ mv -bv awesome-copycats/* ~/.config/awesome; rm -r awesome-copycats

Usage
=====

The modular structure allows to

* set variables
* define startup processes
* change keybindings and layouts
* set client properties

in ``rc.lua``, and

* configure widgets
* define wiboxes and screen settings

in ``theme.lua``, so that you just need to change ``chosen_theme`` variable in ``rc.lua`` to preserve your preferences *and* switch the theme, instead of having N different ``rc.lua`` full of redundancy.

Just do the following:

.. code-block:: shell

    $ cd ~/.config/awesome
    $ cp rc.lua.template rc.lua

Then, set the variable ``chosen_theme`` in ``rc.lua`` to your preferred theme, do your settings, and restart Awesome (``Mod4 + ctrl + r``).

To customize a theme, head over ``themes/$chosen_theme/theme.lua``.

Otherwise, if you want to be synced with upstream, modify ``theme_path`` variable in ``rc.lua`` like this:

.. code-block:: diff

    -local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme)
    +local theme_path = string.format("%s/.config/awesome/themes/%s/theme-personal.lua", os.getenv("HOME"), chosen_theme)

then, copy ``theme.lua`` to ``theme-personal.lua`` and do your customizations there.

This way, you can safely ``git pull`` anytime.

Notes
=====

Complements are provided by lain_ and freedesktop_.

Fonts are Terminus_ (Multicolor, Powerarrow Darker), Tamzen_ (Copland), Roboto_ (Holo, Vertex) and Tamsyn_ (other ones).

Every theme has a colorscheme_.

Blackburn and Dremora use Icons_, Vertex uses FontAwesome_: be sure to have bitmaps enabled if running under Debian or Ubuntu_.

Additional software used: ::

    unclutter firefox scrot mpd mpc dmenu xsel

.. _BY-NC-SA: http://creativecommons.org/licenses/by-nc-sa/4.0
.. _b0ab0d7: https://github.com/copycat-killer/awesome-copycats/tree/b0ab0d7837987be81b9195a36631df773113d491
.. _Awesome: http://github.com/awesomeWM/awesome
.. _lucamanni: https://github.com/lucamanni/awesome
.. _romockee: https://github.com/romockee/powerarrow
.. _ok100: http://ok100.deviantart.com/art/DWM-January-2013-348656846
.. _amouly: https://bbs.archlinux.org/viewtopic.php?pid=1307158#p1307158
.. _swordfischer: https://github.com/copycat-killer/awesome-copycats/issues/53
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
.. _FontAwesome: https://github.com/FortAwesome/Font-Awesome
.. _branches: https://github.com/copycat-killer/awesome-copycats/branches
