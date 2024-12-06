return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {},
	config = function()
		require("render-markdown").setup({
			checkbox = {
				custom = {
					important = {
						raw = "[~]",
						rendered = "⚠ ",
						highlight = "DiagnosticError",
						scope_highlight = "@markup.strikethrough",
					},
				},
			},
		})
	end,
}
