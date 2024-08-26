-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- My keymappings

-- Marks
-- Disable jumping to marks, Map backtick and single quote do nothing
vim.keymap.set('n', '`', '<Esc>', { noremap = true, silent = true, desc = 'No-op the backtick key, ***Not sure why the NOP not working' })
vim.keymap.set('n', "'", '<NOP>', { noremap = true, silent = true, desc = 'No-op the single quote key' })
-- Optional: Disable setting marks as well
vim.keymap.set('n', 'm', '<NOP>', { noremap = true, silent = true, desc = 'No-op the mark setting key' })

-- some stuff I had in vim

vim.keymap.set('n', 'bk', '<C-O>', { noremap = true, silent = true, desc = 'jumplist go back' })
vim.keymap.set('n', 'fwd', '<C-I>', { noremap = true, silent = true, desc = 'jumplist go forward' })
-- Open terminal window at bottom of screen with 15 rows
-- nnoremap bt :bo term ++rows=15<CR> 
vim.keymap.set('n', 'bt', ':bo term ++rows=15<CR>', { noremap = true, silent = true, desc = 'open terminal at bottom of screen'})
-- Open vertical terminal to the left (can't see option to make to the right)
-- nnoremap vt :vert term <CR> 
vim.keymap.set('n', 'vt', ':set nosplitright<CR>:vert term<CR>:set splitright<CR>', { noremap = true, silent=true, desc='open vertical terminal'})
-- double esc to set vim terminal to pause vim terminal (this one is already handled above)
-- tnoremap <Esc><Esc> <C-\><C-n>

-- switch between header/source with F4
vim.keymap.set('n', '<F4>', ':ClangdSwitchSourceHeader<CR>', { noremap = true, silent = true, desc='switch between source and header file'})

-- END some stuff I had in vim

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
