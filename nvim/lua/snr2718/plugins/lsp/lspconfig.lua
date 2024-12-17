-- TODO: Setup nvim-navic for breadcrumbs.
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "SmiteshP/nvim-navic" },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local navic = require("nvim-navic")

		vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
		vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
		vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

		navic.setup({
			highlight = true,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				if vim.bo.filetype == "markdown" or vim.bo.filetype == "md" then
					vim.lsp.stop_client(event.client_id)
					return
				end

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				local opts = { buffer = event.buf }

				if client.server_capabilities.documentFormattingProvider then
					navic.attach(client, event.buf)
				end

				-- these will be buffer-local keybindings
				-- because they only work if you have an active language server

				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
				vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
				vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
				vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
				vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
				vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
				vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
			end,
		})

		lspconfig.ts_ls.setup({
			capabilities = capabilities,
		})

		lspconfig.pyright.setup({
			capabilities = capabilities,
		})

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
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
	end,
}
