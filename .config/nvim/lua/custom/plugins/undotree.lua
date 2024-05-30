return {
  'jiaoshijie/undotree',
  dependencies = 'nvim-lua/plenary.nvim',
  keys = { -- load the plugin only when using it's keybinding:
    { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>" },
  },
  config = function()
    local undo = require 'undotree'
    undo.setup {
      float_diff = true,
      window = {
        winblend = 0,
      },
    }

    -- Equalize window size on toggle
    vim.keymap.set('n', '<leader>u', function()
      undo.toggle()
      vim.cmd 'wincmd ='
    end, { desc = 'Toggle [U]ndo Tree' })
  end,
}
