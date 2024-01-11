return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies={
    --LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
  },
  config = function()
    local lsp_zero = require('lsp-zero')

    lsp_zero.on_attach(function(_, bufnr)
      lsp_zero.default_keymaps({buffer = bufnr})
      local opts = {buffer = bufnr}
      vim.keymap.set({'n', 'x'}, 'gq', function()
        vim.lsp.buf.format({async = false, timeout_ms = 5000})
      end, opts)
    end)

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {
        'tsserver',
        'eslint',
        'svelte',
        'lua_ls',
        'gopls'
      },
      handlers = {
        lsp_zero.default_setup
      }
    })

    local cmp = require("cmp")
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({select = true})
      }),
      completion = {completeopt = "menu,menuone,noinsert"},
      preselect = cmp.PreselectMode.None
    })

    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    vim.diagnostic.config({
      virtual_text = {
        source = true,
      },
      float = {
        source = true,
      }
    })

    require('lspconfig').lua_ls.setup{
      settings = {
        Lua = {
          diagnostics = {
              globals = { 'vim' }
          }
        }
      }
    }
  end
}
