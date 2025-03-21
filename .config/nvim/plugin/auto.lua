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
