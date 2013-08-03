Yahoo's Awesome (WM) Weather Notification
================================

Yawn is a module for Awesome WM providing brief and compact
weather notification via naughty lib and Yahoo! Weather API.

Originally a fork of <a href="https://github.com/ioga/perceptive">perceptive</a>, it became a completely new module after various improvements and style changes.

Usage
-----
Clone yawn repository into your $XDG_CONFIG_HOME/awesome (Awesome config dir).
Then, add in your rc.lua:

    require("yawn")
    yawn.register(123456)

where the function argument is so-called WOEID code of your city.
To obtain it you can google 'yahoo weather %CITYNAME%' and follow the first link.
It will look like 

    http://weather.yahoo.com/united-states/california/san-diego-2487889/

and the last number in that link will be the ID you need.

Default units and text widget color are Celsius and #D7D7D7, but they can be changed.
If you just want to change the color, add a second argument like this:

    yawn.register(123456, "#EEEEEE")

if you want to set Fahrenheit units, add a third argument like this:

    yawn.register(123456, "#EEEEEE", "f")

color argument can be *nil* if you don't want to change it.

Finally, add yawn to your wibox of choice, for instance:

    right_layout:add(yawn.icon)
    right_layout:add(yawn.widget)

if you just want the notification attached to an existent widget, use *attach* instead:

    yawn.attach(*yourwidget*, 123456)

or 

    yawn.attach(*yourwidgetagain*, 123456, "f")

you can also create a shortcut for the weather popup. In my rc.lua I've got this:

    awful.key({ altkey,  }, "w", function () yawn.show_weather(5) end) 

where altkey is set right below modkey like this:

    altkey = "Mod1"

so I can call the popup for 5 seconds pressing Alt+w.

Localization
-----
The default language is English, but if you wish to have a localization, you
have to add a proper file in ``localizations``. You'll find a
template to fill in the subdirectory. 

Once you're done, rename it like your locale id, without ".utf8". In my case:

    $ lua
    Lua 5.2.1  Copyright (C) 1994-2012 Lua.org, PUC-Rio
    > print(os.getenv("LANG"))
    it_IT.utf8
    > 

hence my file (Italian localization) has been named "it_IT".

**NOTE:** If you create a localization, feel free to send me! I will add it.

Screenshot
-----
![Screenshot][1]

[1]: http://i.imgur.com/6JtjdBF.jpg

License
-----
<a href="http://www.wtfpl.net"><img src="http://www.wtfpl.net/wp-content/uploads/2012/12/logo-220x1601.png"/></a>
