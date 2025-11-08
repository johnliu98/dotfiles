return {
  {
    'karb94/neoscroll.nvim',
    config = function()
      local neoscroll = require 'neoscroll'
      local keymap = {
        ['<C-u>'] = function()
          neoscroll.ctrl_u { duration = 100 }
        end,
        ['<C-d>'] = function()
          neoscroll.ctrl_d { duration = 100 }
        end,
        ['<C-b>'] = function()
          neoscroll.ctrl_b { duration = 150 }
        end,
        ['<C-f>'] = function()
          neoscroll.ctrl_f { duration = 150 }
        end,
        ['<C-y>'] = function()
          neoscroll.scroll(-0.1, { move_cursor = false, duration = 0 })
        end,
        ['<C-e>'] = function()
          neoscroll.scroll(0.1, { move_cursor = false, duration = 0 })
        end,
        ['zt'] = function()
          neoscroll.zt { half_win_duration = 20 }
        end,
        ['zz'] = function()
          neoscroll.zz { half_win_duration = 10 }
        end,
        ['zb'] = function()
          neoscroll.zb { half_win_duration = 20 }
        end,
      }

      local modes = { 'n', 'v', 'x' }
      for key, func in pairs(keymap) do
        vim.keymap.set(modes, key, func)
      end

      -- Scroll LSP hover documentation
      vim.keymap.set({ 'n', 'i', 's' }, '<C-d>', function()
        if not require('noice.lsp').scroll(4) then
          keymap['<C-d>']()
        end
      end, { silent = true })
      vim.keymap.set({ 'n', 'i', 's' }, '<C-u>', function()
        if not require('noice.lsp').scroll(-4) then
          keymap['<C-u>']()
        end
      end, { silent = true })
      vim.keymap.set({ 'n', 'i', 's' }, '<C-f>', function()
        if not require('noice.lsp').scroll(8) then
          keymap['<C-f>']()
        end
      end, { silent = true })
      vim.keymap.set({ 'n', 'i', 's' }, '<C-b>', function()
        if not require('noice.lsp').scroll(-8) then
          keymap['<C-b>']()
        end
      end, { silent = true })
    end,
  },
}
