-- yawn, a weather notification module for Awesome WM 3.5+

local os = require("os")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local io = require("io")
local debug = require("debug")

local string = string
local timer = timer
local print = print
local tonumber = tonumber

module('yawn')

local project_path = debug.getinfo(1, 'S').source:match[[^@(.*/).*$]]
local localizations_path = project_path .. '/localizations/'
local icon_path = project_path .. 'icons/'
local api_url = 'http://weather.yahooapis.com/forecastrss'
local chosen_units = '?u=c&w=' -- default is Celsius
local weather_data = nil
local notification = nil
local city_id = nil
sky_na = icon_path .. "na.png"
local sky = nil
local chosen_color = nil
local language = string.gsub(os.getenv("LANG"), ".utf8", "") 

icon = wibox.widget.imagebox()
widget = wibox.widget.textbox()

function execute(url, callback)
 
    -- Reads from url, then runs the callback function on it
    
    local f = io.popen("curl --connect-timeout 1 -fsm 3 '" .. url .. "'" )
    local ws = f:read("*all")
    f:close()

    local execute_timer = timer({ timeout = 7 })
    execute_timer:connect_signal("timeout", function()
        execute_timer:stop()
        callback(ws)
    end)
    execute_timer:start()
end

function fetch_weather()
    execute(api_url..chosen_units..city_id, function(text)

        -- In case of no connection or invalid city ID, widgets won't display
        if text == "" or text:match("City not found") 
        then
            sky = sky_na
            if text == "" then
                weather_data = "Service not available at the moment."
            else
                weather_data = "<b>City not found!</b>\n" .. 
                               "Are you sure " .. city_id .. " is your Yahoo city ID?"
            end
            return
        end

        -- Processing raw data
        weather_data = text:gsub("<.->", "")
        weather_data = weather_data:match("Current Conditions:.-Full")
        weather_data = weather_data:gsub("Current Conditions:.-\n", "Now: ")
        weather_data = weather_data:gsub("Forecast:.-\n", "")
        weather_data = weather_data:gsub("\nFull", "")
        weather_data = weather_data:gsub("[\n]$", "")
        weather_data = weather_data:gsub(" [-] " , ": ")
        weather_data = weather_data:gsub("[.]", ",")
        weather_data = weather_data:gsub("High: ", "")
        weather_data = weather_data:gsub(" Low: ", " - ")

        -- Getting info for text widget
        local now = weather_data:sub(weather_data:find("Now:")+5, weather_data:find("\n")-1)
        local forecast = now:sub(1, now:find(",")-1)
        local units = now:sub(now:find(",")+2, -2)

        -- Day/Night icon change
        hour = tonumber(os.date("%H")) if hour >= 6 and hour <= 18
        then -- Day
            if forecast == "Clear" or forecast == "Fair" then sky = icon_path .. "24.png"
            elseif forecast == "Partly Cloudy" then sky = icon_path .. "26.png"
            elseif forecast == "Mostly Cloudy" then sky = icon_path .. "20.png"
            end
        else -- Night
            if forecast == "Clear" or forecast == "Fair" then sky = icon_path .. "23.png"
            elseif forecast == "Partly Cloudy" then sky = icon_path .. "25.png"
            elseif forecast == "Mostly Cloudy" then sky = icon_path .. "19.png"
            end
        end
 
        if sky == nil then
            if forecast == "Cloudy" then sky = icon_path .. "18.png"
            elseif forecast == "Sunny" then sky = icon_path .. "10.png"
            elseif forecast == "Rain/Thunder" then sky = icon_path .. "00.png"
            elseif forecast == "Light Snow Showers" then sky = icon_path .. "09.png"
            elseif forecast == "Snow Flurries" or
                   forecast == "Blowing Snow" then sky = icon_path .. "12.png"
            elseif forecast:find("Snow Showers") ~= nil or
                   forecast:find("Snow") ~= nil or
                   forecast:find("Sleet") ~= nil then sky = icon_path .. "11.png"            
            elseif forecast == "Mixed Rain And Snow" then sky = icon_path .. "02.png"
            elseif forecast == "Mixed Rain And Sleet" then sky = icon_path .. "04.png"
            elseif forecast == "Mixed Rain And Hail" then sky = icon_path .. "03.png"
            elseif forecast == "Freezing Drizzle" then sky = icon_path .. "05.png"
            elseif forecast == "Freezing Rain" then sky = icon_path .. "06png"
            elseif forecast:find("Wind") ~= nil then sky = icon_path .. "17.png"
            elseif forecast == "Heavy Snow" then sky = icon_path .. "13.png"
            elseif forecast:find("Rain") ~= nil or
                   forecast:find("Drizzle") ~= nil then sky = icon_path .. "07.png"
            elseif forecast:find("Showers") ~= nil or
                   forecast:find("Thunderstorm") ~= nil or
                   forecast:find("Thunder") ~= nil then sky = icon_path .. "08.png" 
            elseif forecast == "Hail" then sky = icon_path .. "14.png"
            elseif forecast == "Foggy" or forecast == "Haze" then sky = icon_path .. "16.png"
            else sky = sky_na
            end
        end

        -- Setting widgets
        icon:set_image(sky)
        widget:set_markup(" <span font='Tamsyn 10' color='" .. chosen_color .. "'>" .. units .. "</span>")
        
        -- Localization
        if language:find("en_") == nil
        then
            for line in io.lines(localizations_path .. language)
            do
                word = string.sub(line, 1, line:find("|")-1)
                translation = string.sub(line, line:find("|")+1)
                weather_data = string.gsub(weather_data, word, translation)
            end
        end
    end)
end

function remove_weather()
    if notification ~= nil then
        naughty.destroy(notification)
        notification = nil
    end
end

function show_weather(t_out)
    fetch_weather()
    remove_weather()
    notification = naughty.notify({
        text = weather_data,
        icon = sky,
        timeout = t_out,
        hover_timeout = 0.5,
        --fg = beautiful.fg_normal,
        fg = "#D4D4D4",
        bg = beautiful.bg_normal
    })
end

function register(id, color, u)
    if u == "f" then chosen_units = '?u=f&w=' end
    chosen_color = color or "#d7d7d7"
    city_id = id
    fetch_weather()
    update_timer = timer({ timeout = 600 })
    update_timer:connect_signal("timeout", function()
        fetch_weather()
    end)
    update_timer:start()
    fetch_weather()

    icon:connect_signal("mouse::enter", function()
        show_weather(0)
    end)
    icon:connect_signal("mouse::leave", function()
        remove_weather()
    end)
end

function attach(widget, id, u)
    register(id, nil, u)
    widget:connect_signal("mouse::enter", function()
        show_weather(0)
    end)
    widget:connect_signal("mouse::leave", function()
        remove_weather()
    end)
end
