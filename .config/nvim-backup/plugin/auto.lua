-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Disable auto-comment in normal mode
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    vim.opt.formatoptions:remove 'o'
  end,
})

-- Disable numbers of terminal
-- Enter terminal in insert mode
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.cmd ':startinsert'
  end,
})

-- vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNew', 'BufNewFile' }, {
--   group = vim.api.nvim_create_augroup('buffer-open', { clear = true }),
--   callback = function()
--     require('no-neck-pain').enable {}
--   end,
-- })

-- Create an autocommand group
local wrap_for_text_files = vim.api.nvim_create_augroup('WrapForTextFiles', { clear = true })

-- Set textwidth for text and markdown files
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'text', 'markdown' },
  group = wrap_for_text_files,
  callback = function()
    vim.opt_local.textwidth = 80
  end,
})
