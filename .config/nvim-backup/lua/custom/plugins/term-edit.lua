return {
  'chomosuke/term-edit.nvim',
  event = 'TermOpen',
  version = '1.*',
  config = function()
    require('term-edit').setup {
      prompt_end = '%$ ',
    }
  end,
}
