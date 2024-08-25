local local_config_dir = vim.fn.expand('~/.config/vim/')
local local_plugin_dir = local_config_dir .. 'plugins/'

return {
  {
    'copilot.vim', -- Name of the plugin
    dir = local_plugin_dir .. 'copilot.vim-1.22.0', -- Path to local Copilot plugin directory
    config = function()
      -- Add any configuration specific to Copilot here
      vim.g.copilot_proxy = 'http://proxy.gtm.citadelgroup.com:80/'
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-f>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },
}
