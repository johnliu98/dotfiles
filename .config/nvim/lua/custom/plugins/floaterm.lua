return {
  'voldikss/vim-floaterm',
  keys = { '<C-t>' },
  cmd = { 'FloatermToggle' },
  config = function()
    local g = vim.g
    g.floaterm_width = 0.5
    g.floaterm_height = 0.99
    g.floaterm_position = 'right'

    vim.keymap.set({ 'n', 'v', 'x' }, '<C-t>', '<cmd>FloatermToggle<CR>', { desc = 'Floating [T]erminal' })
    vim.keymap.set('t', '<C-t>', '<C-\\><C-N><cmd>FloatermToggle<CR>', { desc = 'Floating [T]erminal' })
  end,
}
