return {
  {
    -- "folke/tokyonight.nvim",
    "rebelot/kanagawa.nvim",
    lazy=false,
    priority=1000,
    opts={},
    config = function ()
      -- vim.cmd("colorscheme tokyonight-moon")
      vim.cmd("colorscheme kanagawa")
    end
  }
}
