return {

	-- nvim-tree
	require("snr2718.plugins.nvim-tree"),

	-- lsp
	require("snr2718.plugins.lsp"),

	-- dap
	require("snr2718.plugins.dap"),

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

	-- Git
	require("snr2718.plugins.git"),

	require("snr2718.plugins.hardtime"),
}
