return {

	-- nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			-- Disable netrw
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			require("nvim-tree").setup({
				hijack_cursor = true, -- Moves cursor to the tree when opened
				hijack_netrw = true, -- Replaces netrw with nvim-tree
				update_cwd = true, -- Updates the root directory to match the CWD
				update_focused_file = { -- Automatically focuses on the current file
					enable = true,
					update_cwd = false, -- Do not change the root directory when focusing the file

					ignore_list = {}, -- Files to ignore when focusing
				},
			})

			-- Keymaps
			vim.keymap.set("n", "<Leader>nt", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
			vim.keymap.set("n", "<Leader>no", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
		end,
	},

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

	require("snr2718.plugins.hardtime"),
}
