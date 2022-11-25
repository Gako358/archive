local filesystem = require('gears.filesystem')
local with_dpi = require('beautiful').xresources.apply_dpi
local get_dpi = require('beautiful').xresources.get_dpi
local rofi_command = 'env /usr/bin/rofi -show drun -display-drun -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'

return {
  -- List of apps to start by default on some actions
  default = {
    terminal = 'env kitty',
    rofi = rofi_command,
    lock = 'slock',
    quake = 'kitty',
    weechat = 'kitty --class "weechat" -e weechat',
    screenshot = '~/.config/awesome/core/utils/screenshot -m',
    region_screenshot = '~/.config/awesome/core/utils/screenshot -r',
    delayed_screenshot = '~/.config/awesome/core/utils/screenshot --delayed -r',

    -- Editing these also edits the default program
    -- associated with each tag/workspace
    browser = 'Firefox',
    editor = 'neovim', -- gui text editor
    social = 'discord',
    game = rofi_command,
    files = 'pcmanfm',
    virt = 'virt-manager',
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    -- Add applications that need to be killed between reloads
    -- to avoid multipled instances, inside the autostart script
    '~/.config/awesome/core/autostart', -- Spawn "dirty" apps that can linger between sessions
  }
}
