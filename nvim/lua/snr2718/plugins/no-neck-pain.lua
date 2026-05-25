return {
	"shortcuts/no-neck-pain.nvim",
	version = "*",
	config = function()
		require("no-neck-pain").setup({
			width = 150,
		})
		vim.keymap.set("n", "<leader>pc", "<cmd>NoNeckPain<CR>")
	end,
}
