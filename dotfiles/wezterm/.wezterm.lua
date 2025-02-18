-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Solarized Light (Gogh)'
config.color_scheme = 'Solarized (light) (terminal.sexy)'
-- config.color_scheme = 'Spring'

config.font = wezterm.font 'Fira Code'
config.font_size = 15

-- config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 10

-- cannonical solarized
-- local canonical_solarized = require "canonical_solarized"
-- canonical_solarized.apply_to_config(config)

-- click url links
config.mouse_bindings = {
  -- Disable the default click behavior
  {
    event = { Up = { streak = 1, button = "Left"} },
    -- mods = "NONE",
    action = wezterm.action.DisableDefaultAssignment,
  },
  -- Ctrl-click will open the link under the mouse cursor
  {
    event = { Up = { streak = 1, button = "Left" } },
    -- mods = "CTRL",
    mods = "SUPER",
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
  -- Disable the Ctrl-click down event to stop programs from seeing it when a URL is clicked
  {
    event = { Down = { streak = 1, button = "Left" } },
    -- mods = "CTRL",
    action = wezterm.action.Nop,
  },
}

wezterm.on("open-uri", function(window, pane, uri)
	wezterm.log_info(window)
	wezterm.log_info(pane)
	wezterm.log_info(uri)
end)

-- and finally, return the configuration to wezterm
return config

