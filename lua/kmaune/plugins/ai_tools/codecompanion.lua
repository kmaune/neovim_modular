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
        qwen_coder = function()
          return require('codecompanion.adapters').extend('ollama', {
            name = 'qwen_coder',
            schema = {
              model = {
                default = "qwen2.5-coder:14b"
              },
              num_ctx = {
                default = 20000,
              },
              num_predict = {
                default = -1,
              },
            },
          })
        end,
        qwen_coder_small = function()
          return require('codecompanion.adapters').extend('ollama', {
            name = 'qwen_coder',
            schema = {
              model = {
                default = "qwen2.5-coder:7b"
              },
              num_ctx = {
                default = 20000,
              },
              num_predict = {
                default = -1,
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = 'qwen_coder',
        },
        inline = { adapter = 'qwen_coder' },
      },
      opts = {
        log_level = 'DEBUG',
      },
    },
  },
}
