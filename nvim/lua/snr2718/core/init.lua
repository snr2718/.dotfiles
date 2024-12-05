-- set leader
vim.g.mapleader = " "

-- Line Numbers
vim.o.number = true
vim.o.relativenumber = true

-- Indentation
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Window traversals
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })

-- source ~/.config/nvim/init.lua
vim.api.nvim_create_user_command("So", "source ~/.config/nvim/init.lua", {})

--clear highlighting after search
vim.keymap.set("n", "<leader>/", ":noh<CR>", { noremap = true })

-- Move cursor to new window after split
vim.keymap.set("n", "<leader>vs", ":vsplit<CR><C-w>w", { noremap = true })
vim.keymap.set("n", "<leader>hs", ":split<CR><C-w>w", { noremap = true })

--Exploreer
vim.keymap.set("n", "<leader>nt", vim.cmd.Ex)

-- Markdown specific
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.cmd("echo 'Markdown FileType event triggered'")
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<leader>st",
			":s/^\\(\\s*\\|\\*[ ]\\|\\d+[.]\\)/&\\~\\~/|s/$/\\~\\~/<CR>",
			{ noremap = true, silent = true }
		)
		vim.cmd("highlight DoneLine guifg=green ctermfg=green")
		vim.cmd("match DoneLine /.*-- Done\\.\\?$/") -- Match lines ending with "-- Done"
	end,
})

-- Lua function to delete a quickfix list entry
local function deleteQuickFixLine()
	local bufnr = vim.api.nvim_get_current_buf()
	local qflist = vim.fn.getqflist()
	local index = vim.fn.line(".") - 1
	if index >= 0 and index < #qflist then
		table.remove(qflist, index + 1) -- Lua tables are 1-indexed
		vim.fn.setqflist({}, "r", { items = qflist })
		vim.api.nvim_set_current_buf(bufnr) -- Ensure we stay in the quickfix window

		-- Adjust the cursor position to stay at the next line or the last line if we removed the last entry
		local new_line = index < #qflist and index + 1 or #qflist
		vim.api.nvim_win_set_cursor(0, { new_line, 0 })
	end
end

-- Set up an autocmd in Lua for Neovim
vim.api.nvim_create_augroup("QuickFixDDMapping", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "QuickFixDDMapping",
	pattern = "qf",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "dd", "", {
			callback = deleteQuickFixLine,
			noremap = true,
			silent = true,
		})
	end,
})
