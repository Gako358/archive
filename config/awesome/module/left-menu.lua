local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local beautiful = require("beautiful")

-- Create a launcher widget and a main menu
awful.screen.connect_for_each_screen(function(s)

    -- Submenu
    awesomemenu = {
        {"Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end},
        -- {"Manual", terminal .. " -e man awesome"},
        -- {"Edit Config", editor .. " " .. awesome.conffile},
        {"Restart", awesome.restart},
        {"Quit", function() awesome.quit() end}
    }

    -- Powermenu
    powermenu = {
        {"Power OFF", function() awful.spawn.with_shell("poweroff") end},
        {"Reboot", function() awful.spawn.with_shell("reboot") end},
        {"Suspend", function()
            lock_screen_show()
            awful.spawn.with_shell("slock")
        end},
        {"Lock Screen", function() lock_screen_show() end}
    }

    -- Mainmenu
    mymainmenu = awful.menu({
        items = {
            {"Terminal", function() awful.spawn.with_shell(terminal) end},
            {"Code Editor", function() awful.spawn.with_shell(editor) end},
            {"File Manager", function() awful.spawn.with_shell(files) end},
            {"Web Browser", function() awful.spawn.with_shell(browser) end},
            {"AwesomeWM", awesomemenu,  beautiful.awesome_logo},
            {"Power Menu", powermenu}
        }
    })
end)


