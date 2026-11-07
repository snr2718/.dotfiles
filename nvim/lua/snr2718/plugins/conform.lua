-- Used for adding formatters

return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				-- Golang
				go = { "goimports", "gofmt" },

				-- javascript / Typescript
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },

				-- JSON
				json = { "prettierd" },

				-- Lua
				lua = { "stylua" },

				-- Python
				python = { "black" },

				rust = { "rustfmt" },

				sql = { "sqlfluff" },

				graphql = { "prettierd" },
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
