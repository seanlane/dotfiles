-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Argonaut (Gogh)'
config.automatically_reload_config = true
config.font_size = 14.0

-- and finally, return the configuration to wezterm
return config
