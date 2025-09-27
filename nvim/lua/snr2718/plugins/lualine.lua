return {
	"nvim-lualine/lualine.nvim",
	requires = { "nvim-tree/nvim-web-devicons", opt = true },
	config = function()
		require("lualine").setup({
			options = {
				theme = require("lualine.themes.base16"),
			},
			tabline = {
				lualine_c = { { "filename", path = 1 } },
			},
			winbar = {
				lualine_c = {
					{
						"navic",
						color_correction = nil,
						navic_opts = nil,
					},
				},
			},
		})
	end,
}
