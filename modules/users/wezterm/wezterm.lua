local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Atelier Dune (base16)'
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.use_fancy_tab_bar = false

config.audible_bell = 'Disabled'
config.visual_bell = {
  fade_in_duration_ms = 75,
  fade_out_duration_ms = 75,
  target = 'CursorColor',
}

config.disable_default_key_bindings = false

return config
