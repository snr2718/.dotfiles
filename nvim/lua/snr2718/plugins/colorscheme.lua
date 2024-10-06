return {
  -- {
  --   'sainnhe/gruvbox-material',
  --   name='gruvbox-material',
  --   config = function()
  --     vim.cmd('colorscheme gruvbox-material')
  --     vim.cmd("highlight MatchParen guibg=red ctermbg=red")
  --   end,
  -- },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   name = "kanagawa",
  --   config = function()

  --     require('kanagawa').setup({
  --       overrides = function()
  --         return {
  --           Visual = { bg = "#3B5B6E" },
  --         }
  --       end,
  --     })
  --     vim.cmd('colorscheme kanagawa')
  --   end
  -- },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function ()
      vim.cmd('colorscheme tokyonight')
    end
  }
}
