-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Terminal mode
vim.keymap.set('t', '<ESC>', '<C-\\><C-N><cmd>nohlsearch<CR>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<C-h>', '<C-\\><C-N><C-w>h', { desc = 'Move left' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-N><C-w>j', { desc = 'Move down' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-N><C-w>k', { desc = 'Move up' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-N><C-w>l', { desc = 'Move right' })

-- Window nagivation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Disable F1 in insert mode
vim.keymap.set('i', '<F1>', '<nop>')

-- Toggle relative numbers
vim.keymap.set('n', '<leader>n', '<cmd>set relativenumber!<CR>', { desc = 'Toggle relative numbers' })

-- Resize windows
vim.keymap.set('n', '>', '<C-w>>', { desc = 'Increase window size' })
vim.keymap.set('n', '<', '<C-w><', { desc = 'Decrease window size' })

-- Toggle relative numbers
vim.keymap.set('n', '<leader>n', '<cmd>set relativenumber!<CR>', { desc = 'Toggle relative numbers' })

-- Don't copy the replaced text after pasting in visual mode
vim.keymap.set('x', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Don't copy replaced text", silent = true })

-- Move block
vim.keymap.set({ 'v', 'x' }, 'J', ":m '>+1<CR>gv=gv", { desc = 'Move block up', noremap = true, silent = true })
vim.keymap.set({ 'v', 'x' }, 'K', ":m '<-2<CR>gv=gv", { desc = 'Move block down', noremap = true, silent = true })

-- Indent line
vim.keymap.set('v', '<', '<gv', { silent = true })
vim.keymap.set('v', '>', '>gv', { silent = true })

-- Quickfix list
vim.keymap.set('n', '<M-j>', '<cmd>cnext<CR>', { desc = 'Move next quickfix list' })
vim.keymap.set('n', '<M-k>', '<cmd>cprev<CR>', { desc = 'Move previous quickfix list' })

-- Quit
vim.keymap.set('n', 'Q', ':qa!<CR>', { desc = '[Q]uit force' })
