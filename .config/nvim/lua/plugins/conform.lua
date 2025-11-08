return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    config = function()
      require('conform').setup {
        notify_on_error = false,
        format_on_save = function(bufnr)
          local disable_filetypes = { cpp = true, proto = true }
          if disable_filetypes[vim.bo[bufnr].filetype] then
            return nil
          else
            return {
              timeout_ms = 500,
              lsp_format = 'fallback',
            }
          end
        end,
        formatters_by_ft = {
          lua = { 'stylua' },
          go = { 'goimports', 'gofumpt', 'golines' },
          c = { 'clang-format' },
          python = { 'black' },
        },
      }

      require('conform').formatters.golines = {
        prepend_args = { '-m', '120', '-t', '1', '--shorten-comments', '--reformat-tags' },
      }
    end,
  },
}
