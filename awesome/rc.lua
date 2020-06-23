-- Standard awesome library
local gears = require("gears")
awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
local beautiful = require("beautiful")

--require("myrc.xrandr")

-- EXTENSIONS (functions etc)
local myro  = require("myrc.run_once")  -- run app as long it's not running already

-- {{{ Variable definitions
modkey     = "Mod4"
altkey     = "Mod1"
terminal   = "urxvt"
editor     =  "vim"
editor_cmd = terminal .. " -e " .. editor
-- user defined
browser    = "firefox"
filebrowser = "urxvt -e ranger"

client.connect_signal("focus", function(c)
    os.execute("notifcation-send " + c.name)
    if(c.name == "Slack" or c.name == "telegram-desktop") 
    then
      os.execute("setxkbmap se")
    end
end)

client.connect_signal("unfocus", function(c)
  if(c.name == "Slack" or c.name == "telegram-desktop") 
  then
    os.execute("setxkbmap us")
  end
end)


-- THEME
-- default theme
beautiful.init(os.getenv("HOME") .. "/.config/awesome/theme.lua")
require("settings.wallpaper")

-- Default modkey (DEFAULT Mod4 = WinKey)
modkey = "Mod4"

-- TAGS (screens) && LAYOUTS
require("settings.tags")

--dpms function
require("myrc.dpms")



-- Key && mouse bindings
require("settings.custom_binds")
root.keys(globalkeys) -- this actually sets the keys

-- WINDOW RULES
-- rules per app (placement, floating, etc)
require("settings.window_rules")

-- SIGNALs function to execute when a new client appears.
require("stock.signals")

-- STARTUP apps
require("settings.startup")
