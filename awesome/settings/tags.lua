local awful = require("awful")

-- LAYOUTS
-- comment
layouts =
{
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.top,
    awful.layout.suit.tile.horizontal,
    awful.layout.suit.max.fullscreen
}
-- TAGS (aka screens)
-- two options, for single or dual display
awful.screen.connect_for_each_screen(function(s)
    -- Each screen has its own tag table.
    awful.tag({ "1" }, s, layouts[1])
    awful.tag.add("2", { layout = layouts[4],screen=s})
    awful.tag.add("3", { layout = layouts[1],screen=s})
    awful.tag.add("4", { layout = layouts[1],screen=s})
    awful.tag.add("5", { layout = layouts[1],screen=s})
    awful.tag.add("6", { layout = layouts[1],screen=s})
    awful.tag.add("7", { layout = layouts[1],screen=s})
end)


