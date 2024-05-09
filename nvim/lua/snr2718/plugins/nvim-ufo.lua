return { -- UFO
  "kevinhwang91/nvim-ufo",
  dependencies = "kevinhwang91/promise-async",
  event = "VimEnter", -- needed for folds to load in time and comments closed
  config = function()

    if vim.bo.filetype == 'markdown' or vim.bo.filetype == 'md' then
      -- vim-markdown plugin will take care of folding
      return
    end
    -- INFO fold commands usually change the foldlevel, which fixes folds, e.g.
    -- auto-closing them after leaving insert mode, however ufo does not seem to
    -- have equivalents for zr and zm because there is no saved fold level.
    -- Consequently, the vim-internal fold levels need to be disabled by setting
    -- them to 99
    vim.opt.foldlevel = 999
    vim.opt.foldlevelstart = 999
    -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
    local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
    for _, ls in ipairs(language_servers) do
      require('lspconfig')[ls].setup({
        capabilities = capabilities
        -- you can add other fields for setting up lsp server in this table
      })
    end
    require('ufo').setup()

    -- Key mappings specific to ufo, only set up when ufo is active
    local map_opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', 'zm', '<cmd>lua require("ufo").closeAllFolds()<CR>', map_opts)
    vim.api.nvim_set_keymap('n', 'zr', '<cmd>lua require("ufo").openFoldsExceptKinds { "comment", "imports" }<CR>', map_opts)
    vim.api.nvim_set_keymap('n', 'zR', '<cmd>lua require("ufo").openFoldsExceptKinds {}<CR>', map_opts)
    vim.api.nvim_set_keymap('n', 'zk', '<cmd>lua require("ufo").goPreviousClosedFold()<CR>', map_opts)
    vim.api.nvim_set_keymap('n', 'zj', '<cmd>lua require("ufo").goNextClosedFold()<CR>', map_opts)
  end,
}
