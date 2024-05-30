-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Don't copy the replaced text after pasting in visual mode
vim.keymap.set('x', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', { desc = "Don't copy replaced text", silent = true })

-- Move block
vim.keymap.set({ 'v', 'x' }, 'J', ":m '>+1<CR>gv=gv", { desc = 'Move block up', noremap = true, silent = true })
vim.keymap.set({ 'v', 'x' }, 'K', ":m '<-2<CR>gv=gv", { desc = 'Move block down', noremap = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', ']d', require('nvim-next.integrations').diagnostic().goto_next(), { desc = 'Next [D]iagnostic' })
vim.keymap.set('n', '[d', require('nvim-next.integrations').diagnostic().goto_prev(), { desc = 'Previous [D]iagnostic' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Quit
vim.keymap.set('n', 'Q', ':qa!<CR>', { desc = '[Q]uit' })
