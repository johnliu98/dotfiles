return {
  {
    'catppuccin/nvim',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        transparent_background = true,
        styles = {
          comments = {},
        },
        custom_highlights = function(colors)
          return {
            NormalFloat = { bg = colors.base },
            FloatBorder = { bg = colors.base },
          }
        end,
        integrations = {
          blink_cmp = true,
          harpoon = true,
          notify = true,
          mason = true,
          noice = true,
        },
      }

      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
