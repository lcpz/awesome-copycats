Awesome WM Copycats
===================

-------------------------
Themes for Awesome WM 4.x
-------------------------

:Author: Luca CPZ
:Version: git
:License: BY-NC-SA_
:Source: https://github.com/lcpz/awesome-copycats

Description
===========

A set of themes for the Awesome_ window manager, version 4.x.

See branches_ for previous versions.

Purpose
=======

The main purpose of this repository is to spread ready to use configurations, which can also serve as a cookbook for customisation.

A secondary aim is to add new themes only when they constitute different UI/UX designs.

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

    $ git clone --recursive https://github.com/lcpz/awesome-copycats.git
    $ mv -bv awesome-copycats/* ~/.config/awesome && rm -rf awesome-copycats

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

in ``theme.lua``, so that you just need to change ``chosen_theme`` variable in ``rc.lua`` to preserve your preferences *and* switch the theme, instead of having file redundancy.

Just do the following:

.. code-block:: shell

    $ cd ~/.config/awesome
    $ cp rc.lua.template rc.lua

Then, set the variable ``chosen_theme`` in ``rc.lua`` to your preferred theme, do your settings, and restart Awesome (``Mod4 + ctrl + r``).

To customize a theme, head over to ``themes/$chosen_theme/theme.lua``.

Otherwise, if you want to be synced with upstream, modify the theme path in ``rc.lua`` like this:

.. code-block:: diff

    -beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))
    +beautiful.init(string.format("%s/.config/awesome/themes/%s/theme-personal.lua", os.getenv("HOME"), chosen_theme))

then, copy ``theme.lua`` to ``theme-personal.lua`` and do your customizations there.

This way, you can safely ``git pull`` anytime.

Notes
=====

Complements are provided by lain_ and freedesktop_. **Be sure** to satisfy their dependencies.

The fonts used in the screenshots are: Terminus_ (Multicolor, Powerarrow, Powerarrow Dark), Roboto_ (Holo, Vertex) and Tamsyn_ (other ones).

As taglist font, Blackburn and Dremora use Icons_, Vertex uses FontAwesome_: be sure to have bitmaps enabled if running under Debian or Ubuntu_.

Due the removal of support for bitmap fonts in Pango 1.44_, the current main font is Terminus (OTB version). Under Arch Linux, use ``community/terminus-font-otb``.

Every theme has a colorscheme_.

You can also configure the ``city_id`` in the following snippet in ``/.config/awesome/themes/<<CHOSEN_THEME>>/theme.lua`` to get the correct weather information (we suggest doing it in your ``theme-personal.lua``):

.. code-block::

     -- Weather
        local weathericon = wibox.widget.imagebox(theme.widget_weather)
        theme.weather = lain.widget.weather({
            city_id = 2643743, -- placeholder (London)
            notification_preset = { font = "Terminus 10", fg = theme.fg_normal },
            weather_na_markup = markup.fontfg(theme.font, "#eca4c4", "N/A "),
            settings = function()
                descr = weather_now["weather"][1]["description"]:lower()
                units = math.floor(weather_now["main"]["temp"])
                widget:set_markup(markup.fontfg(theme.font, "#eca4c4", descr .. " @ " .. units .. "°C "))
            end
        })

You can find your ``city_id`` in city.list.json.gz_ after you extract it.

Additional default software used: ::

    dmenu firefox mpc mpd scrot unclutter xsel slock

.. _BY-NC-SA: http://creativecommons.org/licenses/by-nc-sa/4.0
.. _b0ab0d7: https://github.com/lcpz/awesome-copycats/tree/b0ab0d7837987be81b9195a36631df773113d491
.. _Awesome: http://github.com/awesomeWM/awesome
.. _lucamanni: https://github.com/lucamanni/awesome
.. _romockee: https://github.com/romockee/powerarrow
.. _ok100: http://ok100.deviantart.com/art/DWM-January-2013-348656846
.. _amouly: https://bbs.archlinux.org/viewtopic.php?pid=1307158#p1307158
.. _swordfischer: https://github.com/lcpz/awesome-copycats/issues/53
.. _foozer: http://dotshare.it/dots/499
.. _lain: https://github.com/lcpz/lain
.. _freedesktop: https://github.com/lcpz/awesome-freedesktop
.. _Terminus: http://terminus-font.sourceforge.net
.. _Tamzen: https://github.com/sunaku/tamzen-font
.. _Roboto: https://fonts.google.com/specimen/Roboto
.. _Tamsyn: http://www.fial.com/~scott/tamsyn-font
.. _colorscheme: https://github.com/lcpz/dots/tree/master/.colors
.. _Icons: https://github.com/lcpz/dots/tree/master/.fonts
.. _Ubuntu: https://wiki.ubuntu.com/Fonts#Enabling_Bitmapped_Fonts
.. _FontAwesome: https://github.com/FortAwesome/Font-Awesome
.. _branches: https://github.com/lcpz/awesome-copycats/branches
.. _city.list.json.gz: http://bulk.openweathermap.org/sample/city.list.json.gz
.. _1.44: https://github.com/lcpz/awesome-copycats/issues/269
