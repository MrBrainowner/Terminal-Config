-- This is needed for Wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux

config.font_size = 14
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = true
config.front_end = "OpenGL"
config.max_fps = 144
-- config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
-- config.cursor_blink_rate = 500
config.window_padding = {
  bottom = 0,
}

-- config.font = wezterm.font("Cascadia Code")

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local index = tab.tab_index -- 0-based index
  return {
    { Text = index .. " -----" },
  }
end)


-- config.enable_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

-- ------------------------------------------------------------------------------------- optional
config.window_background_opacity = 0.30
config.color_scheme = "tokyonight-storm"
-- ------------------------------------------------------------------------------------- background image
-- config.window_background_image = 'C:/customize/bg-anime0.jpg'

-- ------------------------------------------------------------------------------------- Keybindings
-- ------------------------------------------------------------------------------------- Keybindings

config.keys = {
  {
    key = "[",
    mods = "CTRL|ALT",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },

  -- Open new horizontal pane
  {
    key = "]",
    mods = "CTRL|ALT",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },

  -- Close the current pane
  {
    key = "\\",
    mods = "CTRL|ALT",
    action = wezterm.action.CloseCurrentPane({ confirm = false }),
  },

  -- Travel between panes (Neovim-style)
  {
    key = "h",
    mods = "CTRL|ALT",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },

  {
    key = "j",
    mods = "CTRL|ALT",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },

  {
    key = "k",
    mods = "CTRL|ALT",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },

  {
    key = "l",
    mods = "CTRL|ALT",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
}

return config
