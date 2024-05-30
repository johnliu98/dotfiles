return { -- Repeat movments
  'ghostbuster91/nvim-next',
  config = function()
    local next = require 'nvim-next'
    next.setup {
      default_mappings = {
        repeat_style = 'directional',
      },
      items = {
        require('nvim-next.builtins').f,
        require('nvim-next.builtins').t,
      },
    }
  end,
}
