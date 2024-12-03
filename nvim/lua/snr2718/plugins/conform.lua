-- Used for adding formatters

return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "gofmt" },
				javascript = { "eslint_d", "prettierd" },
				typescript = { "eslint_d", "prettierd" },
				javascriptreact = { "eslint_d", "prettierd" },
				typescriptreact = { "eslint_d", "prettierd" },
				json = { "prettierd" },
			},
			format_on_save = {
				-- lsp_format = "fallback",
				timeout_ms = 3000,
			},
			notify_on_error = true,
			notify_no_formatters = true,
		})
	end,
}
