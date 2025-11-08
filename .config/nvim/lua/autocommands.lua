-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
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

-- Set textwidth for text and markdown files
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'text', 'markdown' },
  group = vim.api.nvim_create_augroup('WrapForTextFiles', { clear = true }),
  callback = function()
    vim.opt_local.textwidth = 80
  end,
})
