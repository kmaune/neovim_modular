return {
  {
    'olimorris/codecompanion.nvim',
    config = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      adapters = {
        ollama = function()
          return require('codecompanion.adapters').extend('ollama', {
            schema = {
              num_ctx = {
                default = 20000,
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = 'ollama',
        },
        inline = { adapter = 'ollama' },
      },
      opts = {
        log_level = 'DEBUG',
      },
    },
  },
}
