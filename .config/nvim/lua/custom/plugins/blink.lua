return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',
  version = 'v0.*',
  config = function()
    require('blink.cmp').setup {
      keymap = { preset = 'default' },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
        providers = {
          lsp = {
            score_offset = 1000,
            fallbacks = { 'lazydev' },
          },
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
          },
        },
      },
      completion = {
        menu = {
          border = 'rounded',
        },
        documentation = { -- TODO: Add border to documentation.
          auto_show = true,
          auto_show_delay_ms = 500,
          window = {
            border = 'rounded',
            max_width = 120,
          },
        },
      },
    }
  end,
}
