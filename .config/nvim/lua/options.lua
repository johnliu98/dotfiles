vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

vim.o.number = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.breakindent = true
vim.o.wrap = false
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '  ', trail = ' ', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 8
vim.o.confirm = true
vim.o.tabstop = 8
vim.o.softtabstop = 8
vim.o.shiftwidth = 8
vim.o.expandtab = true
vim.o.swapfile = false
vim.o.hidden = true
vim.o.colorcolumn = '120'
vim.o.spelllang = 'en_us'
vim.o.spell = true
vim.o.termguicolors = true
