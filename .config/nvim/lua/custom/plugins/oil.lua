return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
    }
    vim.keymap.set('n', '-', '<cmd>Oil<CR>')
  end,
}
