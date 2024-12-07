local local_config_dir = vim.fn.expand('~/.config/vim/')
local local_plugin_dir = local_config_dir .. 'plugins/'

return {
  {
    'copilot.vim', -- Name of the plugin
    dir = local_plugin_dir .. 'copilot.vim-1.22.0', -- Path to local Copilot plugin directory
    config = function()
      -- Add any configuration specific to Copilot here
      vim.g.copilot_proxy = 'http://proxy.gtm.citadelgroup.com:80/'
      vim.api.nvim_set_keymap("i", "<C-Space>", 'copilot#Accept()', { silent = true, expr = true, replace_keycodes = false })
      -- vim.g.copilot_no_tab_map = true -- only seems to work if in keymaps.lua
    end,
  },
}
