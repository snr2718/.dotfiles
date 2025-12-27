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
			sql = { "sqlfluff" },

			go = { "golangcilint" },
			gomod = { "golangcilint" },
			gosum = { "golangcilint" },
		}

		lint.linters.sqlfluff = {
			cmd = "sqlfluff",
			args = { "lint", "-" },
			stdin = true,
			cwd = function()
				return vim.fn.getcwd() -- or the root of your repo if you use a rooter
			end,
		}

		vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {

			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
