return {
  {
    'sainnhe/gruvbox-material',
    name='gruvbox-material',
    enabled = true,
    config = function()
      vim.cmd('colorscheme gruvbox-material')
      vim.cmd("highlight MatchParen guibg=red ctermbg=red")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    enabled = false,
    config = function()
      vim.cmd('colorscheme kanagawa')
    end
  }
}
