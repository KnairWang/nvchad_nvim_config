require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

vim.o.guifont = "Hack Nerd Font Mono:h10"

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- vim.o.guifont = "Hack Nerd Font Mono,Symbols Nerd Font Mono:h12"
  vim.g.neovide_scroll_animation_length = 0.25
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_no_idle = false
  vim.g.neovide_fullscreen = false
  vim.g.neovide_remember_window_size = false

  vim.g.neovide_cursor_animation_length = 0.13
  vim.g.neovide_cursor_trail_size = 0.35
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_cursor_unfocused_outline_width = 0.125

  vim.g.neovide_cursor_smooth_blink = true

  -- "railgun", "torpedo", "pixiedust", "sonicboom", "ripple", "wireframe"
  vim.g.neovide_cursor_vfx_mode = "sonicboom"
  vim.g.neovide_cursor_vfx_opacity = 200.0 -- Sets the transparency of the generated particles.
  vim.g.neovide_cursor_vfx_particle_lifetime = 3.0 -- Sets the amount of time the generated particles should survive.
  vim.g.neovide_cursor_vfx_particle_density = 32.0 -- Sets the number of generated particles.
  vim.g.neovide_cursor_vfx_particle_speed = 15.0 -- Sets the speed of particle movement.
  vim.g.neovide_cursor_vfx_particle_phase = 1.5 -- Only for the railgun vfx mode.
  vim.g.neovide_cursor_vfx_particle_curl = 1.0 -- Only for the railgun vfx mode.
end

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = true
vim.opt.numberwidth = 6
vim.opt.mouse = ""
vim.opt.showmode = true
vim.opt.scrolloff = 10
