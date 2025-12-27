-- TODO: Setup nvim-navic for breadcrumbs.
return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local filetype = vim.bo[event.buf].filetype
				if filetype == "markdown" or filetype == "md" then
					vim.lsp.stop_client(event.data.client_id)
					return
				end

				local opts = { buffer = event.buf }

				-- these will be buffer-local keybindings
				-- because they only work if you have an active language server

				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			end,
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		vim.lsp.config("ts_ls", {})
		vim.lsp.enable("ts_ls")

		-- vim.lsp.config("pyright", {})
		-- vim.lsp.enable("pyright")

		vim.lsp.config("basedpyright", {
			settings = {
				basedpyright = {
					typeCheckingMode = "standard",
				},
			},
		})
		vim.lsp.enable("basedpyright")

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})
		vim.lsp.enable("lua_ls")

		vim.lsp.config("rust_analyzer", {
			settings = {
				["rust_analyzer"] = {
					diagnostics = {
						enable = true,
					},
					cargo = { allFeatures = true },
					checkOnSave = { command = "clippy" },
				},
			},
		})
		vim.lsp.enable("rust_analyzer")

		vim.lsp.config("csharp_ls", {})
		vim.lsp.enable("csharp_ls")

		vim.lsp.config("gopls", {
			settings = {
				gopls = {
					analyses = {
						shadow = true, -- detect variable shadowing
						unusedparams = true, -- flag unused function parameters
						nilness = true, -- nil flow analysis
						unusedwrite = true, -- writes to unused variables
						useany = true, -- warn when using interface{} / any unnecessarily
						atomicalign = true, -- detect incorrect atomic alignment
					},
					staticcheck = true, -- enables many additional checks
				},
			},
		})

		vim.lsp.enable("gopls")
	end,
}
