return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  config = function()
    require('conform').setup {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { proto = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        end
        return {
          timeout_ms = 1000,
          lsp_format = 'fallback',
        }
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

    -- -- Organize import on save
    -- vim.api.nvim_create_autocmd('BufWritePre', {
    --   pattern = '*.go',
    --   callback = function()
    --     local params = vim.lsp.util.make_range_params(0, 'utf-16')
    --     params.context = { only = { 'source.organizeImports' } }
    --     local timeout_ms = 2000
    --     local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params, timeout_ms)
    --     for cid, res in pairs(result or {}) do
    --       for _, r in pairs(res.result or {}) do
    --         if r.edit then
    --           local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or 'utf-16'
    --           vim.lsp.util.apply_workspace_edit(r.edit, enc)
    --         end
    --       end
    --     end
    --     vim.lsp.buf.format { async = false }
    --   end,
    -- })
  end,
}
