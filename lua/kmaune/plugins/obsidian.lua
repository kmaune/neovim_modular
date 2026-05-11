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

    callbacks = {
      enter_note = function(_note)
        vim.keymap.set('n', 'gf', function()
          return require('obsidian').util.gf_passthrough()
        end, { noremap = false, expr = true, buffer = true })
        vim.keymap.set('n', '<leader>ch', function()
          return require('obsidian').util.toggle_checkbox()
        end, { buffer = true })
        vim.keymap.set('n', '<cr>', function()
          return require('obsidian').util.smart_action()
        end, { buffer = true, expr = true })
      end,
    },

    workspaces = (function()
      local vault = vim.fn.expand('~/Library/Mobile Documents/iCloud~md~obsidian/Documents/ObsidianVault-Main')
      if vim.fn.isdirectory(vault) == 1 then
        return { { name = 'personal', path = vault } }
      end
      return {}
    end)(),

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
