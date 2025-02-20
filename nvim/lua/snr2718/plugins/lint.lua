return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			-- Javascript/Typescript
			javascript = { "eslint_d", "cspell" },
			javascriptreact = { "eslint_d", "cspell" },
			typescript = { "eslint_d", "cspell" },
			typescriptreact = { "eslint_d", "cspell" },
			-- Python
			python = { "mypy", "cspell" },
			lua = { "cspell" },
		}

		vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {

			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
