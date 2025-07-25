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
	{
		{
			"tpope/vim-fugitive",
			event = "VeryLazy",
		},
		{
			"sindrets/diffview.nvim",
			event = "VeryLazy",
		},
		{
			"lewis6991/gitsigns.nvim",
			event = "VeryLazy",
		},
	},

	-- Harpoon
	require("snr2718.plugins.harpoon"),

	-- Which-key
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},

	-- Hardtime
	-- Enforces good nvim practices by limiting certain key presses
	require("snr2718.plugins.hardtime"),
}
