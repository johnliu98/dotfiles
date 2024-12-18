-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('t', '<Esc><Esc>', '<cmd><CR><C-\\><C-n>nohlsearch', { desc = 'Exit terminal mode' })

-- Toggle relative numbers
vim.keymap.set('n', '<leader>n', '<cmd>set relativenumber!<CR>')

-- Don't copy the replaced text after pasting in visual mode
vim.keymap.set('x', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Don't copy replaced text", silent = true })

-- Move block
vim.keymap.set({ 'v', 'x' }, 'J', ":m '>+1<CR>gv=gv", { desc = 'Move block up', noremap = true, silent = true })
vim.keymap.set({ 'v', 'x' }, 'K', ":m '<-2<CR>gv=gv", { desc = 'Move block down', noremap = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', ']d', require('nvim-next.integrations').diagnostic().goto_next(), { desc = 'Next [D]iagnostic' })
vim.keymap.set('n', '[d', require('nvim-next.integrations').diagnostic().goto_prev(), { desc = 'Previous [D]iagnostic' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('v', '>', '>gv', { silent = true })
vim.keymap.set('v', '<', '<gv', { silent = true })

-- Quit
vim.keymap.set('n', 'Q', ':qa!<CR>', { desc = '[Q]uit' })
