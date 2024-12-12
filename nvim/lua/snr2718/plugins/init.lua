return {

	-- nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			-- disable netrw
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			require("nvim-tree").setup({})
		end,
	},

	-- lsp
	require("snr2718.plugins.lsp"),

	-- Appearance
	require("snr2718.plugins.treesitter"),
	require("snr2718.plugins.colorscheme"),
	require("snr2718.plugins.lualine"),
	require("snr2718.plugins.nvim-ufo"),
	require("snr2718.plugins.indent-blankline"),

	-- IDE tools
	require("snr2718.plugins.telescope"),
	require("snr2718.plugins.bqf"),
	require("snr2718.plugins.toggleterm"),

	-- Auto completions
	require("snr2718.plugins.nvim-autopairs"),
	require("snr2718.plugins.copilot"),

	-- Linting
	require("snr2718.plugins.lint"),

	-- formatting
	require("snr2718.plugins.conform"),

	require("snr2718.plugins.render-markdown"),

	require("snr2718.plugins.hardtime"),
}
