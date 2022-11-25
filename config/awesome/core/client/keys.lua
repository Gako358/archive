local awful = require('awful')
require('awful.autofocus')
local modkey = require('core.keys.mod').modKey
local altkey = require('core.keys.mod').altKey

local clientKeys =
  awful.util.table.join(
  awful.key(
    {modkey},
    'f',
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    {description = 'toggle fullscreen', group = 'client'}
  ),
  awful.key(
    {modkey},
    'q',
    function(c)
      c:kill()
    end,
    {description = 'close', group = 'client'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'f',
    awful.client.floating.toggle,
    {description = 'toggle floating', group = 'client'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'j',
    function ()
      awful.client.swap.byidx(  1)
    end,
    {description = 'swap with next client', group = 'client'}
  ),
  awful.key(
    {modkey, 'Shift'},
    'k',
    function ()
      awful.client.swap.byidx( -1)
    end,
    {description = 'swap with previous client', group = 'client'}
  ),
  awful.key(
    {modkey},
    'j',
    function ()
      awful.client.focus.byidx( 1)
    end,
    {description = 'focus the next by index', group = 'screen'}
  ),
  awful.key(
    {modkey},
    'k',
    function ()
      awful.client.focus.byidx( -1)
    end,
    {description = 'focus the previous by index', group = 'screen'}
  )
)

return clientKeys
