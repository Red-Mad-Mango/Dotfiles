-- core/keymaps.lua
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Tab management
map('n', '<Leader>tn', ':tabnext<CR>', opts)
map('n', '<Leader>tp', ':tabprevious<CR>', opts)
map('n', '<Leader>tc', ':tabclose<CR>', opts)
map('n', '<Leader>tN', ':tabnew<CR>', opts)

-- Split window management
map('n', '<Leader>sh', ':split<CR>', opts)
map('n', '<Leader>sv', ':vsplit<CR>', opts)
map('n', '<Leader>h',  '<C-w>h', opts)
map('n', '<Leader>j',  '<C-w>j', opts)
map('n', '<Leader>k',  '<C-w>k', opts)
map('n', '<Leader>l',  '<C-w>l', opts)
map('n', '<Leader>sc', '<C-w>c', opts)

-- File actions
map('n', '<Space>w', ':w<CR>', opts)
map('n', '<Space>q', ':q<CR>', opts)
map('n', '<Space>e', ':Explore<CR>', opts)



