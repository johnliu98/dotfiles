return {
  'ghostbuster91/nvim-next',
  config = function()
    require('nvim-next').setup {
      default_mappings = {
        repeat_style = 'directional',
      },
      items = {
        require('nvim-next.builtins').f,
        require('nvim-next.builtins').t,
      },
    }
    vim.keymap.set('n', ']d', require('nvim-next.integrations').diagnostic().goto_next(), { desc = 'Next [D]iagnostic' })
    vim.keymap.set('n', '[d', require('nvim-next.integrations').diagnostic().goto_prev(), { desc = 'Previous [D]iagnostic' })
  end,
}
