return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    {
      'gf',
      function()
        return require('obsidian').util.gf_passthrough()
      end,
      noremap = false,
      expr = true,
      buffer = true,
    },
    {
      '<leader>ch',
      function()
        return require('obsidian').util.toggle_checkbox()
      end,
      buffer = true,
    },
    {
      '<cr>',
      function()
        return require('obsidian').util.smart_action()
      end,
      buffer = true,
      expr = true,
    },
  },
  opts = {
    legacy_commands = false,

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
