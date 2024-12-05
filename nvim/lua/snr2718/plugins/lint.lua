return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			-- Javascript/Typescript
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			-- Python
			python = { "mypy" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {

			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
