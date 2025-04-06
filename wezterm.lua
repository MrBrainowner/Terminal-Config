-- This is needed for Wezterm API
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux

config.font_size = 15
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = true

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local index = tab.tab_index -- 0-based index
  return {
    { Text = index .. " -----" },
  }
end)

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- config.enable_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

-- ------------------------------------------------------------------------------------- optional
config.window_background_opacity = 0.95
config.color_scheme = "tokyonight_night"
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
