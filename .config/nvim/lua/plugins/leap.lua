return {
  'ggandor/leap.nvim',
  keys = { 's', 'S' },
  dependencies = 'tpope/vim-repeat',
  init = function()
    require('leap').create_default_mappings()
  end,
}
