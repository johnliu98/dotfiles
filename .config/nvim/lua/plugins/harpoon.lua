return {
  'ThePrimeagen/harpoon',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local mark = require 'harpoon.mark'
    local ui = require 'harpoon.ui'

    vim.keymap.set('n', 'ma', function()
      mark.add_file()
    end, { desc = 'Mark file' })

    vim.keymap.set('n', 'mt', function()
      ui.toggle_quick_menu()
    end, { desc = 'Toggle menu' })

    vim.keymap.set('n', 'm1', function()
      ui.nav_file(1)
    end, { desc = 'Toggle menu' })

    vim.keymap.set('n', 'm2', function()
      ui.nav_file(2)
    end, { desc = 'Toggle menu' })

    vim.keymap.set('n', 'm3', function()
      ui.nav_file(3)
    end, { desc = 'Toggle menu' })

    vim.keymap.set('n', 'm4', function()
      ui.nav_file(4)
    end, { desc = 'Toggle menu' })
  end,
}

-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
