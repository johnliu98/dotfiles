return {
  {
    'sindrets/diffview.nvim',
    config = function()
      vim.keymap.set('n', '<leader>do', '<cmd>DiffviewOpen -uno<CR>', { desc = '[D]iffview [O]pen' })
      vim.keymap.set('n', '<leader>dc', '<cmd>DiffviewClose<CR>', { desc = '[D]iffview [C]lose' })
    end,
  },
}
