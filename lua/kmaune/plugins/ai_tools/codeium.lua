return {
  {
    'Exafunction/codeium.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      require('codeium').setup {
        enable_cmp_source = false, -- set to true for nvim-cmp integration
        -- Customize virtual text appearance
        virtual_text = {
          enabled = true,

          -- How long to wait (in ms) before requesting completions after typing stops.
          idle_delay = 75,
          -- Set to false to disable all key bindings for managing completions.
          map_keys = true,
          -- The key to press when hitting the accept keybinding but no completion is showing.
          -- Defaults to \t normally or <c-n> when a popup is showing.
          accept_fallback = nil,
          -- Key bindings for managing completions in virtual text mode.
          key_bindings = {
            -- Accept the current completion.
            accept = '<C-Space>',
            -- Accept the next word.
            accept_word = '<M-w>',
            -- Accept the next line.
            accept_line = '<M-l>',
            -- Clear the virtual text.
            clear = '<M-c>',
            -- Cycle to the next completion.
            next = '<M-]>',
            -- Cycle to the previous completion.
            prev = '<M-[>',
          },
        },
      }
    end,
  },
}
