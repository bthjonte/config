-- Signals
-- Signal function to execute when a new client appears.
awful = require("awful")
beautiful = require("beautiful")
local sloppyfocus_last = {c=nil}

tag.connect_signal("request::screen",function(t)
   for s in screen do
        if s ~= t.screen then 
            local t2 = awful.tag.find_by_name(s, t.name)
            if t2 then
                t:swap(t2)
            else
                t.screen = s
            end
            return
      end
    end
end
)

client.connect_signal("manage",
function(c)
  if not awesome.startup then awful.client.setslave(c) end
  if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
    awful.placement.no_offscreen(c)
  end
end
)

client.connect_signal("mouse::enter", function(c)
     if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
        and awful.client.focus.filter(c) then
         -- Skip focusing the client if the mouse wasn't moved.
         if c ~= sloppyfocus_last.c then
             client.focus = c
             sloppyfocus_last.c = c
         end
     end
 end)
-- No border for maximized clients
client.connect_signal("focus",
    function(c)
      local clients = awful.client.visible(s)
      local layout  = awful.layout.getname(awful.layout.get(s))
        if #clients == 1 or layout == "max" or layout == "fullscreen"or layout == "max.fullscreen" then 
            c.border_width = 0
            clients.border_width = 0
        else
            c.border_color = beautiful.border_focus
            c.border_width = 3
        end
    end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

client.connect_signal("focus", function(c)
  if(c.class == "Slack" or c.class == "TelegramDesktop") 
    then
      awful.util.spawn("setxkbmap se")
    end
  end)

client.connect_signal("unfocus", function(c)
  if(c.class == "Slack" or c.class == "TelegramDesktop") 
    then
      awful.util.spawn("setxkbmap us")
    end
  end)


