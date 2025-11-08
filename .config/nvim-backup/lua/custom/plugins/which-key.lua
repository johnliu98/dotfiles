return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    require('which-key').setup()

    require('which-key').add {
      { '<leader>d', desc = '[D]ebug' },
      { '<leader>s', desc = '[S]earch' },
      { '<leader>h', desc = 'Git [H]unk' },
      { 'm', desc = '[M]ark' },
    }

    require('which-key').add {
      { '<leader>h', desc = 'Git [H]unk', mode = 'v' },
    }
  end,
}
