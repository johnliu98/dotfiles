return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    -- require('mini.surround').setup {}

    require('mini.pairs').setup {}

    local statusline = require 'mini.statusline'

    statusline.setup {
      content = {
        active = function()
          local mode, mode_hl = statusline.section_mode {}
          local git = statusline.section_git {}
          local diagnostics = statusline.section_diagnostics {}
          local filename = statusline.section_filename {}
          local fileinfo = statusline.section_fileinfo {}
          local search = statusline.section_searchcount { options = { recompute = true, maxcount = 1000000 } }
          local location = '%2l/%2L:%-2v'
          return statusline.combine_groups {
            { hl = mode_hl, strings = { mode } },
            { hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
            '%<', -- Mark general truncate point
            { hl = 'MiniStatuslineFilename', strings = { filename } },
            '%=', -- End left alignment
            { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
            { hl = mode_hl, strings = { search, location } },
          }
        end,
      },
      use_icons = vim.g.have_nerd_font,
    }
  end,
}
