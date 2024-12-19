return {
  'shortcuts/no-neck-pain.nvim',
  enabled = false,
  config = function()
    require('no-neck-pain').setup { width = 130 }
    vim.keymap.set('n', '<C-s>', '<cmd>NoNeckPain<CR>', { desc = 'Center buffer' })
  end,
}
