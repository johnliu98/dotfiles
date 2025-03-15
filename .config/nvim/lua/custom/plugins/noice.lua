return {
  'folke/noice.nvim',
  enabled = true,
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    local noice = require 'noice'
    noice.setup {
      views = {
        notify = {
          title = '',
          replace = true,
        },
        recording = {
          backend = 'popup',
          relative = 'editor',
          focusable = false,
          align = 'center',
          enter = false,
          zindex = 210,
          position = {
            row = 3,
            col = '50%',
          },
          size = 'auto',
          border = {
            style = 'rounded',
            padding = { 0, 1 },
            text = {
              top = ' Recording ',
            },
          },
          win_options = {
            winhighlight = { Normal = 'Normal', FloatBorder = 'FloatBorder' },
          },
        },
      },
      cmdline = {
        opts = {
          relative = 'editor', -- change to 'win' when bug is fixed.
          position = {
            row = '40%',
            col = '50%',
          },
        },
      },
      presets = {
        long_message_to_split = true, -- long messages will be sent to a split
        command_palette = true, -- position the cmdline and popupmenu together
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      routes = {
        {
          filter = { event = 'msg_show', kind = 'bufwrite' },
          opts = { skip = true },
        },
        {
          filter = { event = 'msg_showmode' },
          view = 'recording',
        },
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
        progress = {
          view = 'notify',
        },
      },
    }
  end,
}
