-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

-- Colorscheme Configurations
-- Lua}
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    styles = {              -- Style to be applied to different syntax groups
      comments = "italic",    -- Value is any valid attr-list value `:help attr-list`
      functions = "bold",
      keywords = "italic",
      numbers = "NONE",
      strings = "NONE",
      types = "italic,bold",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      diagnostic = {        -- Diagnostic module
        background = false,
      },
    },
  }
})

local palettes = {
  nightfox = {
    bg0 = "#1d2021",
    bg1 = "#282828", -- 282828 #1d2021
    fg1 = "#ebdbb2", -- cdcecf
    white = "#d4d4d5",
    black = "#101317",
    red = "#f87070",
    pink = "#ffa7a7",
    green = "#37d99e",
    blue = "#7ab0df",
    yellow = "#ffe59e",
    cyan = "#50cad2",
    magenta = "#c397d8",
    orange = "#f0a988",
    comment = "#928374",
    sel0 = "#1d2021",
  }
}

require("nightfox").setup({ palettes = palettes })

-- setup must be called before loading
vim.cmd("colorscheme nightfox")

local M = {}
-- Theme: gruvbox
--- See: https://github.com/ellisonleao/gruvbox.nvim
M.gruvboxtheme = {
  bg = '#32302f',
  fg = '#ebdbb2',
  pink = '#d3869b',
  green = '#98971a',
  cyan = '#458588',
  yellow = '#d79921',
  orange = '#fe8019',
  purple = '#b16286',
  red = '#fb4934',
  gray = '#928374',
  blue = '#83a598',
}

-- Theme: NightFox
--- See: https://github.com/EdenEast/nightfox.nvim/blob/main/lua/nightfox/palette/nightfox.lua
M.nightfoxtheme = {
  bg = '#1d2021', --default: #131a24
  fg = '#d6d6d7',
  pink = '#d67ad2',
  green = '#81b29a',
  cyan = '#63cdcf',
  yellow = '#dbc074',
  orange = '#f4a261',
  purple = '#9d79d6',
  red = '#c94f6d',
  blue = '#719cd6',
  gray = '#29394e',
}

-- Theme: github-theme (main)
--- See: https://github.com/projekt0n/github-nvim-theme/blob/main/lua/github-theme/palette/dark.lua
--- color names are adapted to the format above
M.githubtheme = {
  black = "#586069",
	bg = "#24292e",  -- default #2c2d30
	fg = "#c9d1d9",
	pink = "#f97583",
	green = "#34d058",
	orange = "#d18616",
	blue = "#2188dd",
	yellow = "#ffea7f",
	cyan = "#39c5cf",
	red = "#ea4a5a",
	grey = "#1f2428",
  purple = "#b392f0",
}

return M
