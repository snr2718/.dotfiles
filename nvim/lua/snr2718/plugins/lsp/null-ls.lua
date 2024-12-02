return {
  'nvimtools/none-ls.nvim',
  enabled = false,
  dependencies = {
    {"nvim-lua/plenary.nvim"}
  },
  config = function ()
    local null_ls = require('null-ls')
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier.with({
          filetypes = {"javascript", "typescript", "javascriptreact", "typescriptreact", "json", "css", "html", "yaml"}
        }),
        null_ls.builtins.diagnostics.codespell.with({
           diagnostics_postprocess = function(diagnostic)
             diagnostic.severity = vim.diagnostic.severity.HINT
           end
        })

      }
    })
  end
}
