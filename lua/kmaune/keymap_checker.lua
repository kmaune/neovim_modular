-- Manual keymap conflict checker for Neovim
-- Add this function to your config or run it in command mode

function CheckKeymapDuplicates()
  local modes = { 'n', 'i', 'v', 'x', 't', 'c', 'o', 's' }
  local all_maps = {}
  local found_duplicates = false

  print '=== Checking for keymap conflicts ==='

  for _, mode in ipairs(modes) do
    local keymaps = vim.api.nvim_get_keymap(mode)
    local mode_maps = {}

    for _, keymap in ipairs(keymaps) do
      local lhs = keymap.lhs

      if mode_maps[lhs] then
        -- Found a duplicate in this mode
        print(string.format("CONFLICT in %s mode: '%s'", mode, lhs))
        print('  First:  ' .. (mode_maps[lhs].rhs or mode_maps[lhs].callback or 'unknown'))
        print('  Second: ' .. (keymap.rhs or keymap.callback or 'unknown'))
        found_duplicates = true
      else
        mode_maps[lhs] = keymap
      end
    end

    all_maps[mode] = mode_maps
  end

  if not found_duplicates then
    print 'No duplicate keymaps found!'
  end

  print '=== Check complete ==='
end

-- Alternative: Check a specific key across all modes
function CheckSpecificKey(key)
  local modes = { 'n', 'i', 'v', 'x', 't', 'c', 'o', 's' }
  print('=== Mappings for key: ' .. key .. ' ===')

  for _, mode in ipairs(modes) do
    local keymaps = vim.api.nvim_get_keymap(mode)
    for _, keymap in ipairs(keymaps) do
      if keymap.lhs == key then
        local rhs = keymap.rhs or tostring(keymap.callback) or 'unknown'
        local desc = keymap.desc or 'no description'
        print(string.format('%s mode: %s -> %s (%s)', mode, key, rhs, desc))
      end
    end
  end
end

-- Usage:
-- :lua CheckKeymapDuplicates()
-- :lua CheckSpecificKey('<Esc>')
-- :lua CheckSpecificKey('gf')

-- Bonus: List all mappings for easy manual inspection
function ShowAllKeymaps()
  local modes = { 'n', 'i', 'v', 'x', 't', 'c', 'o', 's' }

  for _, mode in ipairs(modes) do
    print('=== ' .. mode:upper() .. ' MODE ===')
    local keymaps = vim.api.nvim_get_keymap(mode)

    -- Sort by lhs for easier reading
    table.sort(keymaps, function(a, b)
      return a.lhs < b.lhs
    end)

    for _, keymap in ipairs(keymaps) do
      local rhs = keymap.rhs or 'function'
      local desc = keymap.desc and (' (' .. keymap.desc .. ')') or ''
      print(string.format('  %-15s -> %s%s', keymap.lhs, rhs, desc))
    end
    print ''
  end
end

-- Quick check for common conflict-prone keys
function CheckCommonConflicts()
  local common_keys = {
    '<Esc>',
    '<CR>',
    '<Tab>',
    '<Space>',
    'gf',
    'K',
    'J',
    '<leader>w',
    '<leader>q',
    '<leader>f',
  }

  print '=== Checking common conflict-prone keys ==='
  for _, key in ipairs(common_keys) do
    CheckSpecificKey(key)
    print ''
  end
end
