local awful = require('awful')
local gears = require('gears')
local client_keys = require('core.client.keys')
local client_buttons = require('core.client.buttons')

-- Rules
awful.rules.rules = {
  {
    rule_any = {name = {'Konsole'}},
    properties = {skip_decoration = true}
  },
  -- All clients will match this rule.
  {
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      keys = client_keys,
      buttons = client_buttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_offscreen,
      floating = false,
      maximized = false,
      above = false,
      below = false,
      ontop = false,
      sticky = false,
      maximized_horizontal = false,
      maximized_vertical = false
    }
  },
  -- Titlebars
  {
    rule_any = {type = {'dialog'}, class = {'Wicd-client.py', 'calendar.google.com', 'Pcmanfm', 'ncmpcpp', 'htop', 'mutt', 'scratchy', 'neofetch', }},
    properties = {
      placement = awful.placement.centered,
      ontop = true,
      floating = true,
      drawBackdrop = true,
      shape = function()
        return function(cr, w, h)
          gears.shape.rounded_rect(cr, w, h, 8)
        end
      end,
      skip_decoration = true
    }
  },
  -- Rule for where to spawn
  {
    rule = { class = 'Firefox' },
    properties = { screen = 1, tag = '2' }
  },
  {
    rule = { class = 'discord' },
    properties = { screen = 1, tag = '5' }
  },
  {
    rule = { class = 'weechat' },
    properties = { screen = 1, tag = '4' }
  },
  {
    rule = { class = 'Virt-manager' },
    properties = { screen = 1, tag = '6' }
  },
}
