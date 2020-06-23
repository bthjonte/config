local function dpms(c)
    if c then
        awful.util.spawn_with_shell("xset s off && xset -dpms &")
    else
        awful.util.spawn_with_shell("xset s on && xset +dpms &")
    end
end
