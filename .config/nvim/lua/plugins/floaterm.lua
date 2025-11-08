return {
  {
    'voldikss/vim-floaterm',
    keys = { '<C-t>' },
    cmd = { 'FloatermToggle' },
    config = function()
      vim.g.floaterm_width = 0.5
      vim.g.floaterm_height = 0.99
      vim.g.floaterm_position = 'right'
      vim.g.floaterm_borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }

      vim.keymap.set({ 'n', 'v', 'x' }, '<C-t>', '<cmd>FloatermToggle<CR>', { desc = 'Floating [T]erminal' })
      vim.keymap.set('t', '<C-t>', '<C-\\><C-N><cmd>FloatermToggle<CR>', { desc = 'Floating [T]erminal' })
    end,
  },
}
