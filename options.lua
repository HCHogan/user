-- set vim options here (vim.<first_key>.<second_key> = value)
local neovide_transparency = 0.9
local neovide_transparency_point = 0.8
local alpha = function() return string.format("%x", math.floor((255 * neovide_transparency_point) or 0.8)) end
local neovide_background_color = "#1E1E2D" .. alpha()

return {
  opt = {
    -- set to true or false etc.
    relativenumber = true, -- sets vim.opt.relativenumber
    number = true, -- sets vim.opt.number
    spell = false, -- sets vim.opt.spell
    signcolumn = "auto", -- sets vim.opt.signcolumn to auto
    wrap = false, -- sets vim.opt.wrap
    termguicolors = true,
    scrolloff = 5,
    sidescrolloff = 5,
    list = true,
    listchars = {
      tab = "» ",
      trail = "·",
      extends = "…",
      precedes = "…",
      nbsp = "␣",
    },
  },
  g = {
    mapleader = " ", -- sets vim.g.mapleader
    autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    cmp_enabled = true, -- enable completion at start
    autopairs_enabled = true, -- enable autopairs at start
    diagnostics_mode = 0, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    resession_enabled = false, -- enable experimental resession.nvim session management (will be default in AstroNvim v4)
    -- neovide

    neovide_input_macos_alt_is_meta = true,
    neovide_cursor_vfx_mode = "pixiedust",
    neovide_refresh_rate = 120,
    neovide_refresh_rate_idle = 120,
    neovide_floating_shadow = true,
    neovide_floating_z_height = 10,
    neovide_light_angle_degrees = 45,
    neovide_light_radius = 5,

    neovide_transparency = neovide_transparency,
    neovide_transparency_point = neovide_transparency_point,
    neovide_background_color = neovide_background_color,

    winblend = 50,
    pumblend = 50,

    -- encoding = "UTF-8",
  },
  bo = {
    -- tabstop = 4,
    -- shiftwidth = 4,
    -- softtabstop = 4,
    -- expandtab = true,
  },
  o = {
    guifont = "Recursive:h16",
  },
}

-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
