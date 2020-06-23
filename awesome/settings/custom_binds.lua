local awful  = require("awful")

-- {{{ Key bindings 
globalkeys = awful.util.table.join( 
    -- Tag browsing
    awful.key({ modkey }, "h",   awful.tag.viewprev       ),
    awful.key({ modkey }, "l",  awful.tag.viewnext       ),


    -- Default client focus
    awful.key({ modkey }, "k",function () awful.client.focus.byidx( 1)
        if client.focus then client.focus:raise() end end),
    awful.key({ modkey }, "j", function () awful.client.focus.byidx(-1)
           if client.focus then client.focus:raise() end end),
--screenshot
   awful.key({ }, "Print", function () awful.util.spawn("screenshot") end),
   
     --notification 
     awful.key({altkey,"Shift" }, "k", function () os.execute("notification.sh time") end), 
     awful.key({altkey,"Shift" }, "b", function () os.execute("notification.sh battery") end), 
     awful.key({altkey,"Shift" }, "i", function () os.execute("notification.sh ip") end), 
     awful.key({altkey,"Shift" }, "d", function () os.execute("notification.sh date") end), 
     --awful.key({altkey,"Shift" }, "h", function () os.execute('playerctl previous -p mps-youtube.instance1847411,auryo_player') end),
     --awful.key({altkey,"Shift" }, "l", function () os.execute('playerctl next -p mps-youtube.instance1847411,auryo_player') end),
     --awful.key({altkey,"Shift" }, "p", function () os.execute('playerctl play-pause -p mps-youtube.instance1847411,auryo_player') end),

     awful.key({altkey,"Shift" }, "w", function () awful.util.spawn(terminal .. " -e weather") end), 
    --keyboard
    awful.key({altkey,"Shift" }, "z", function () awful.util.spawn("setxkbmap -layout us ") end), 
    awful.key({altkey,"Shift" }, "x", function () awful.util.spawn("setxkbmap se") end), 

     --software 
    awful.key({modkey,"Shift" }, "f", function () awful.util.spawn(filebrowser) end), 
    --awful.key({modkey,"Shift" }, "s", function () awful.util.spawn("arandr") end), 
    --awful.key({modkey,"Shift" }, "h", function () awful.util.spawn("hdmi_sound_toggle.sh") end), 
    awful.key({ modkey }, "w", function () awful.util.spawn(browser) end),

    --Show Menu 
    awful.key({modkey,"Shift" }, "w", function() awful.util.spawn("j4-dmenu-desktop --dmenu='rofi -dmenu  -i'") end),
    awful.key({modkey,"Shift" }, "r", function() awful.util.spawn("rofi -show run") end),
    awful.key({modkey,"Shift" }, "s", function() awful.util.spawn("rofi -show ssh") end),
    awful.key({modkey,"Shift" }, "n", function() awful.util.spawn("networkmanager_dmenu") end),


    -- Layout manipulation 
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, }, "p", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, }, "o", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),
    awful.key({ modkey, "Shift"   }, "l",      function () awful.tag.incmwfact( 0.05)     end),
    awful.key({ modkey, "Shift"   }, "h",      function () awful.tag.incmwfact(-0.05)     end),
    awful.key({ modkey, "Control" }, "l",      function () awful.tag.incncol(-1)          end),
    awful.key({ modkey, "Control" }, "h",      function () awful.tag.incncol( 1)          end),
    awful.key({ modkey,           }, "space",  function () awful.layout.inc(1,1)  end),
    awful.key({ modkey, "Shift"   }, "space",  function () awful.layout.inc(-1,1)  end),
    awful.key({ modkey, "Control" }, "n",      awful.client.restore),
    awful.key({modkey,"Control" }, "l", function() awful.util.spawn("systemctl suspend") end),

    -- Standard program
    awful.key({ modkey, }, "z", function () awful.screen.focused().quake:toggle() end),
    awful.key({ modkey,   }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({modkey ,"Shift"}, "Return", function () awful.util.spawn(terminal, {
      floating  = true,
      tag       = mouse.screen.selected_tag,
      placement = awful.placement.centered,
    }) end), 
    awful.key({ modkey, "Control" }, "r",      awesome.restart))

    
    clientkeys = awful.util.table.join(
   awful.key({ modkey,           }, "f",      
        function (c)
            c.fullscreen = not c.fullscreen
        end),
    awful.key({ modkey, }, "c",
        function (c)
            if c.fullscreen then
                c.fullscreen = not c.fullscreen
            end
            c:kill()
        end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey, "Shift" }, "o", function(c) awful.client.movetoscreen(c,c.screen-1) end ),
    awful.key({ modkey, "Shift" }, "p", function(c) awful.client.movetoscreen(c,c.screen+1) end ),
    awful.key({ modkey,}, "t", function (c) c.ontop = not c.ontop end),
    awful.key({ modkey,}, "n", function (c) c.minimized = true end),
    awful.key({ modkey,}, "m", function (c)
    c.maximized_horizontal = not c.maximized_horizontal
    c.maximized_vertical   = not c.maximized_vertical end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      local tag = awful.tag.gettags(client.focus.screen)[i]
                      if client.focus and tag then
                          awful.client.movetotag(tag)
                     end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      local tag = awful.tag.gettags(client.focus.screen)[i]
                      if client.focus and tag then
                          awful.client.toggletag(tag)
                      end
                  end))
end

clientbuttons = awful.util.table.join(clientbuttons,
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))



