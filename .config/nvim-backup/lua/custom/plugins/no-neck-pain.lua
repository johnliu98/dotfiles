return {
  'shortcuts/no-neck-pain.nvim',
  config = function()
    require('no-neck-pain').setup {
      width = 140,
      autocmds = {
        enableOnVimEnter = true,
        enableOnTabEnter = true,
        reloadOnColorSchemeChange = true,
        skipEnteringNoNeckPainBuffer = true,
      },
    }
    vim.keymap.set('n', '<C-s>', '<cmd>NoNeckPain<CR>', { desc = 'Center buffer' })
  end,
}
