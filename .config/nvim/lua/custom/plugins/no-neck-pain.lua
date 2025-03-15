return {
  'shortcuts/no-neck-pain.nvim',
  enabled = true,
  config = function()
    require('no-neck-pain').setup { width = 140 }
    vim.keymap.set('n', '<C-s>', '<cmd>NoNeckPain<CR>', { desc = 'Center buffer' })
  end,
}
