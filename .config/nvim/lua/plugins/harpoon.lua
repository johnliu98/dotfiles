return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      harpoon:setup {
        settings = {
          save_on_toggle = true,
        },
      }

      vim.keymap.set('n', 'mg', function()
        harpoon:list():add()
      end, { desc = 'Add [M]ark' })
      vim.keymap.set('n', 'mt', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Toggle [M]ark UI' })

      vim.keymap.set('n', 'ma', function()
        harpoon:list():select(1)
      end, { desc = 'Goto [M]ark 1' })
      vim.keymap.set('n', 'ms', function()
        harpoon:list():select(2)
      end, { desc = 'Goto [M]ark 2' })
      vim.keymap.set('n', 'md', function()
        harpoon:list():select(3)
      end, { desc = 'Goto [M]ark 3' })
      vim.keymap.set('n', 'mf', function()
        harpoon:list():select(4)
      end, { desc = 'Goto [M]ark 4' })
      vim.keymap.set('n', 'mr', function()
        harpoon:list():select(5)
      end, { desc = 'Goto [M]ark 4' })
      vim.keymap.set('n', 'me', function()
        harpoon:list():select(6)
      end, { desc = 'Goto [M]ark 4' })
      vim.keymap.set('n', 'mw', function()
        harpoon:list():select(7)
      end, { desc = 'Goto [M]ark 4' })
      vim.keymap.set('n', 'mq', function()
        harpoon:list():select(8)
      end, { desc = 'Goto [M]ark 4' })

      vim.keymap.set('n', 'mp', function()
        harpoon:list():prev()
      end, { desc = 'Goto Previous [M]ark' })
      vim.keymap.set('n', 'mn', function()
        harpoon:list():next()
      end, { desc = 'Goto Next [M]ark' })
    end,
  },
}
