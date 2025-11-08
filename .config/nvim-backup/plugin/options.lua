local opt = vim.opt

-- Make line numbers default
opt.number = true

--  Use relative line numbers.
opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
opt.showmode = false

-- Don't wrap line
opt.wrap = false

-- Tabs
opt.tabstop = 8
opt.softtabstop = 8
opt.shiftwidth = 8
opt.expandtab = true

-- Sync clipboard between OS and Neovim.
opt.clipboard = 'unnamedplus'

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Don't save swap file
opt.swapfile = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Let buffers stay open,but hidden
opt.hidden = true

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
opt.timeoutlen = 300

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Set colorcolumn
opt.colorcolumn = '120'

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Show which line your cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 8

-- US English spelling
opt.spelllang = 'en_us'
opt.spell = true

-- Rounded borders.
local _border = 'rounded'

vim.diagnostic.config {
  float = { border = _border },
}

-- Use true colors
vim.o.termguicolors = true
