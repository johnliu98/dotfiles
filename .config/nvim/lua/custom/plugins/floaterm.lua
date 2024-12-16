return {
  'voldikss/vim-floaterm',
  keys = { '<leader>f' },
  cmd = { 'FloatermToggle' },
  config = function()
    local g = vim.g
    g.floaterm_width = 0.95
    g.floaterm_height = 0.6
    g.floaterm_position = 'bottom'

    vim.keymap.set({ 'n', 'v', 'x' }, '<leader>f', '<cmd>FloatermToggle<CR>', { desc = '[F]loating Terminal' })
  end,
}
