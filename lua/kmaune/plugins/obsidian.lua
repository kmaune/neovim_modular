return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '/Users/kmaune/Library/Mobile Documents/iCloud~md~obsidian/Documents/ObsidianVault-Main',
      },
    },

    daily_notes = {
      folder = '00 - Daily/Daily Notes',
      date_format = '%Y-%m-%d',
    },

    -- Simple blink completion - let obsidian handle the integration
    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
    },

    -- Keymaps for following links and other obsidian actions
    mappings = {
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      ['<leader>ch'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      ['<cr>'] = {
        action = function()
          return require('obsidian').util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },
  },
}
