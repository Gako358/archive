local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')
local gears = require('gears')
local clickable_container = require('widget.material.clickable-container')

local dpi = require('beautiful').xresources.apply_dpi

local icons = require('theme.icons')

local textclock = wibox.widget.textclock('<span font="Roboto Mono bold 9">%d.%m.%Y\n     %H:%M</span>')

local month_calendar = awful.widget.calendar_popup.month({
  screen = s,
  start_sunday = false,
  week_numbers = true
})
month_calendar:attach(textclock)

local date_widget = wibox.container.margin(textclock, dpi(10), dpi(10), dpi(10), dpi(10))

local DatePanel = function(s, offset)
  local offsetx = 0
  if offset == true then
    offsetx = dpi(128)
    offsety = dpi(7)
  end
  local panel =
    wibox(
    {
      ontop = false,
      screen = s,
      height = dpi(37),
      width = dpi(82),
      x = s.geometry.width - dpi(170),
      y = s.geometry.y  + offsety,
      stretch = false,
      bg = beautiful.primary.hue_500,
      fg = beautiful.fg_normal,
      struts = {
        top = dpi(32)
      }
    }
  )

  panel:struts(
    {
      top = dpi(0)
    }
  )

  panel:setup {
      layout = wibox.layout.fixed.horizontal,
      date_widget,
  }

  return panel
end

return DatePanel
