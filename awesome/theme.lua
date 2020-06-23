
--[[
                                   
     Rainbow Awesome WM config 2.0 
     github.com/copycat-killer     
                                   
--]]

theme                               = {}

theme.dir                           = os.getenv("HOME") .. "/.config/awesome"
theme.wallpaper                     = theme.dir .. "/wall.png"
--font
theme.font                          = "Tamsyn 13.5"
--colors
theme.fg_normal                     = "#9E9E9E"
theme.fg_focus                      = "#EBEBFF"
theme.bg_normal                     = "#202328"
theme.bg_focus                      = "#202328"
theme.fg_urgent                     = "#000000"
theme.bg_urgent                     = "#FFFFFF"
--borders
theme.border_width                  = 3.5
theme.border_normal                 = "#242424"
theme.border_focus                  = "#EBEBFF"
--taglist
theme.taglist_fg_focus              = "#EDEFFF"
theme.taglist_bg_focus              = "#242424"

theme.ocol                          = "<span color='" .. theme.fg_normal .. "'>"
theme.ccol                          = "</span>"
theme.menu_awesome_icon             = theme.dir .."/icons/awesome.png"
theme.submenu_icon                  = theme.dir .."/icons/submenu.png"
theme.taglist_squares_sel           = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel         = theme.dir .. "/icons/square_unsel.png"
theme.vol_bg                        = theme.dir .. "/icons/vol_bg.png"
-- lain related
theme.useless_gap_width             = 0
return theme
