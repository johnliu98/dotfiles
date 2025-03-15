return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha',
      background = {
        light = 'mocha',
        dark = 'mocha',
      },
      integrations = {
        blink_cmp = true,
        harpoon = true,
        notify = true,
        mason = true,
        noice = true,
      },
    }

    vim.cmd.colorscheme 'catppuccin'
    vim.cmd.hi 'Comment gui=none'

    -- Prevents floating buffers to have a contrasting color outside the border.
    vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })

    -- Use same the colors for the auto-complete dropdown.
    vim.api.nvim_set_hl(0, 'Pmenu', { link = 'Normal' })
  end,
}
