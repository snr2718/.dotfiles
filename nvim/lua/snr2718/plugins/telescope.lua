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
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

		require("telescope").load_extension("live_grep_args")
		vim.keymap.set("n", "<leader>fg", function()
			local word = vim.fn.expand("<cword>") -- Get the word under the cursor
			require("telescope.builtin").live_grep({ default_text = word })
		end, { noremap = true, silent = true, desc = "Live grep word under cursor" })
	end,
}
