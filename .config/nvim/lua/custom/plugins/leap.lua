return {
  'ggandor/leap.nvim',
  enabled = false,
  keys = { 's', 'S' },
  dependencies = 'tpope/vim-repeat',
  init = function()
    require('leap').create_default_mappings()
  end,
}
