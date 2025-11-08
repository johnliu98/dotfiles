local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local make_entry = require 'telescope.make_entry'
local config = require('telescope.config').values

local M = {}

M.grep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local finder = finders.new_async_job {
    command_generator = function(prompt)
      if not prompt or prompt == '' then
        return nil
      end

      local patterns = vim.split(prompt, '  ')
      local args = { 'rg' }
      if patterns[1] then
        table.insert(args, '-e')
        table.insert(args, patterns[1])
      end
      if patterns[2] then
        table.insert(args, '-g')
        table.insert(args, patterns[2])
      end

      return vim.tbl_flatten {
        args,
        { '-L', '--vimgrep', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--hidden', '-g=!.git/' },
      }
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  }

  pickers
    .new(opts, {
      debounce = 100,
      prompt_title = 'Multi Grep',
      finder = finder,
      previewer = config.grep_previewer(opts),
      sorter = require('telescope.sorters').empty(),
    })
    :find()
end

return M
