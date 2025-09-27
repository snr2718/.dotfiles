return {
	"SmiteshP/nvim-navic",
	config = function()
		local navic = require("nvim-navic")
		navic.setup({ highlight = true })

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "Attach navic to LSP with symbols",
			callback = function(event)
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentSymbolProvider then
					navic.attach(client, event.buf)
				end
			end,
		})
	end,
}
