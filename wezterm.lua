-- This is needed for Wezterm API 
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font_size = 15
config.window_decorations = "RESIZE"
-- config.hide_tab_bar_if_only_one_tab = false
config.show_tab_index_in_tab_bar = true

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local index = tab.tab_index -- 0-based index
    return {
      { Text = index .. ' -----' },
    }
  end
)



-- config.enable_tab_bar = false
config.tab_and_split_indices_are_zero_based = true

-- ------------------------------------------------------------------------------------- optional
config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 10
config.color_scheme = 'Catppuccin Mocha'

-- ------------------------------------------------------------------------------------- Keybindings
config.keys = {
{
      key = '[',
      mods = 'CTRL|ALT',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },

    -- Open new horizontal pane
    {
      key = ']',
      mods = 'CTRL|ALT',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },

    -- Close the current pane
    {
      key = '\\',
      mods = 'CTRL|ALT',
      action = wezterm.action.CloseCurrentPane { confirm = false },
    },

    -- Travel between panes (Neovim-style)
    {
      key = 'h',
      mods = 'CTRL|ALT',
      action = wezterm.action.ActivatePaneDirection 'Left',
    },

    {
      key = 'j',
      mods = 'CTRL|ALT',
      action = wezterm.action.ActivatePaneDirection 'Down',
    },

    {
      key = 'k',
      mods = 'CTRL|ALT',
      action = wezterm.action.ActivatePaneDirection 'Up',
    },

    {
      key = 'l',
      mods = 'CTRL|ALT',
      action = wezterm.action.ActivatePaneDirection 'Right',
    },
 }


return config
