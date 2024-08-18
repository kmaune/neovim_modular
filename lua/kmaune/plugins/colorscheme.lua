return {
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  { 'cryptomilk/nightcity.nvim', name = 'nightcity', priority = 1000 },

  {
    'rktjmp/lush.nvim', -- Lush is a requirement for Jellybeans
    name = 'lush',
    priority = 1000,
  },
  { 'metalelf0/jellybeans-nvim', name = 'jellybeans', priority = 1000, dependencies = { 'rktjmp/lush.nvim' } },

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      --
      -- Can use any of the colorschems loaded before this line
      --vim.cmd.colorscheme 'tokyonight-night'
      --vim.cmd.colorscheme 'nightcity-kabuki'
      vim.cmd.colorscheme 'jellybeans-nvim'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
