return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
    -- Add nvim-cmp specifically for obsidian
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
  },
  config = function()
    -- Set up nvim-cmp specifically for markdown files (obsidian)
    local cmp = require 'cmp'

    -- Configure cmp only for markdown files
    cmp.setup.filetype('markdown', {
      sources = cmp.config.sources {
        { name = 'obsidian' },
        { name = 'obsidian_new' },
        { name = 'obsidian_tags' },
        { name = 'buffer' },
        { name = 'path' },
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    })

    -- Set up obsidian with the real path (not symlink)
    require('obsidian').setup {
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

      -- Enable completions with nvim-cmp
      completion = {
        nvim_cmp = true,
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
    }
  end,
}
