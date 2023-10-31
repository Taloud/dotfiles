return {
  'nvim-neo-tree/neo-tree.nvim',
  cmd = 'Neotree',
  keys = {
    { '<leader>pv', ':Neotree reveal toggle<CR>' },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    {
      's1n7ax/nvim-window-picker',
      opts = {
        filter_rules = {
          autoselect_one = true,
          include_current_win = false,
          bo = {
            filetype = { 'neo-tree', "neo-tree-popup", "notify" },
            buftype = { 'terminal', "quickfix" },
          },
        },
        highlights = {
          statusline = {
            focused = {
              bg = '#9d7cd8',
            },
            unfocused = {
              bg = '#9d7cd8',
            },
          },
        },
      },
    },
  },
  opts = {
    close_if_last_window = true,
    hide_root_node = true,
    sources = {
      "filesystem",
      "git_status",
      "document_symbols",
    },
    git_status = {
      symbols = {
        -- Change type
        added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted   = "✖",-- this can only be used in the git_status source
        renamed   = "➜",-- this can only be used in the git_status source
        -- Status type
        untracked = "",
        ignored   = "",
        unstaged  = "✗",
        staged    = "",
        conflict  = "",
      }
    },
    source_selector = {
      winbar = true,
      statusline = false,
      -- separator = { left = "", right= "" },
      show_separator_on_edge = true,
      -- highlight_tab = "SidebarTabInactive",
      -- highlight_tab_active = "SidebarTabActive",
      -- highlight_background = "StatusLine",
      -- highlight_separator = "SidebarTabInactiveSeparator",
      -- highlight_separator_active = "SidebarTabActiveSeparator",
    },
    default_component_configs = {
      indent = {
        expander_collapsed = "",
        expander_expanded = "",
        padding = 0,
      },
      name = {
        use_git_status_colors = false,
        highlight_opened_files = true,
      },
    },
    window = {
      mappings = {
        ["<cr>"] = "open_with_window_picker",
      },
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_hidden = false, -- only works on Windows for hidden files/directories
        hide_by_name = {
          ".git",
        },
      },
      follow_current_file = {
        enabled = true,
      },
      group_empty_dirs = false
    },
  },
}
