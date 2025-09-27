vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

vim.diagnostic.config({
	severity_sort = true,
	virtual_text = {
		source = false,
	},
	float = {
		source = false,
	},
})
