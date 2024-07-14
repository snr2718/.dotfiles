return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "echasnovski/mini.icons", "nvim-tree/nvim-web-devicons" },
  config = function ()
    require("oil").setup()
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", {desc = "Open parent directory"})
  end
}
