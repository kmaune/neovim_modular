return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    legacy_commands = false,

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

    completion = {
      nvim_cmp = false,
      blink = true,
      min_chars = 2,
    },
  },
}
