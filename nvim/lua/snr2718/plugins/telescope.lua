return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope-live-grep-args.nvim",
			-- This will not install any breaking changes.
			-- For major updates, this must be adjusted manually.
			version = "^1.0.0",
		},
	},
	config = function()
		local builtin = require("telescope.builtin")
		require("telescope").load_extension("live_grep_args")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<Leader>fr", builtin.oldfiles, {})

		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

		vim.keymap.set({ "n", "v" }, "<leader>fG", function()
			local word

			-- Check if in Visual mode
			if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
				-- Yank the visually selected text
				vim.cmd('normal! "vy') -- Copy visual selection to register 'v'
				word = vim.fn.getreg("v") -- Get text from register 'v'

				-- Trim leading and trailing newlines and spaces
				word = word:gsub("^%s+", ""):gsub("%s+$", "")

				-- Check for newlines in the middle and warn
				if word:find("\n") then
					vim.notify("Selection contains newlines in the middle. Aborting search.", vim.log.levels.WARN)
					return -- Exit without opening Telescope
				end
			else
				-- Get word under the cursor in Normal mode
				word = vim.fn.expand("<cword>")
			end

			-- Escape special characters for Ripgrep compatibility
			word = word:gsub("([^%w])", "\\%1")

			-- Add word boundaries for exact match
			local exact_word = "\\b" .. word .. "\\b"

			-- Pass the cleaned text to live_grep
			require("telescope.builtin").live_grep({ default_text = exact_word })
		end, { noremap = true, silent = true, desc = "Live grep word or visual selection" })

		vim.keymap.set("n", "<leader>fd", function()
			require("telescope.builtin").diagnostics({ bufnr = 0 })
		end, { noremap = true, silent = true, desc = "List Buffer Diagnostics" })
	end,
}
