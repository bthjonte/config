local awful = require("awful")
awful.rules     = require("awful.rules")
require("awful.autofocus")
local beautiful = require("beautiful")

awful.rules.rules = {
    -- All clients will match this rule.
{
    rule = { },
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientkeys,
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap+awful.placement.no_offscreen,
      size_hints_honor = false
    }
},
{ rule = { class = "firefox*"}, properties = {tag="2",switchtotag=true}},
{ rule = { class = "Nextcloud"}, properties = {tag="1",hidden=true }},
{ rule = { class = "Slack"}, properties = {tag="1"}},
{ rule = { class = "mpv"}, properties = {fullscreen=true}},
{ rule = { class = "gimp"}, properties = {fullscreen=true}},
{ rule = { name = "weather"}, properties = {fullscreen=true}},
{ rule = { class = "Gimp"}, properties = {fullscreen=true}},
{ rule = { class = "telegram-desktop"}, properties = {tag="5"}},
{ rule = { class = "TelegramDesktop"}, properties = {tag="5"}},
{ rule = { class = "Standard Notes"}, properties = {tag="6",first_tag=true,fullscreen=true}},
{ rule = { class = "Incrustation vidéo"}, properties = {ontop=true}},
{ rule = { name = "Slack Call Minipanel"}, properties = {tag="1",hidden=true}},
{
  rule = {
    class = "jetbrains-.*",
  }, properties = { focus = true, buttons = clientbuttons_jetbrains,tag="3" }
},
{
  rule = {
    class = "jetbrains-.*",
    name = "win.*"
  }, properties = { titlebars_enabled = false, focusable = false, focus = true, floating = true, placement = awful.placement.restore , tag="3" }
},
}
 
