return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/playground',
    'ghostbuster91/nvim-next',
  },
  config = function()
    -- Prefer git instead of curl in order to improve connectivity in some environments
    require('nvim-treesitter.install').prefer_git = true
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-next.integrations').treesitter_textobjects()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      nvim_next = {
        enable = true,
        textobjects = {
          move = {
            goto_next_start = {
              [']f'] = { query = '@function.name', desc = 'Next function' },
            },
            goto_previous_start = {
              ['[f'] = { query = '@function.name', desc = 'Prevous function' },
            },
          },
        },
      },
      incremental_selection = {
        enable = true,
      },
    }
  end,
}
