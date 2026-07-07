return {
	"ThePrimeagen/harpoon",

	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()

		-- REQUIRED

		vim.keymap.set("n", "<leader>ha", function()
			local list = harpoon:list()
			if list:length() >= 10 then
				print("Harpoon list is full (10 items max)")
				return
			end
			list:add()
			print("Added current file to Harpoon list")
		end)
		-- vim.keymap.set("n", "<leader>hl", function()
		-- 	harpoon.ui:toggle_quick_menu(harpoon:list())
		-- end)

		for i = 0, 9 do
			vim.keymap.set("n", "<leader>h" .. i, function()
				harpoon:list():select(i + 1)
			end)
		end

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end)

		-- basic telescope configuration
		local conf = require("telescope.config").values
		local entry_display = require("telescope.pickers.entry_display")
		local function toggle_telescope(harpoon_files)
			local make_finder = function()
				local results = {}
				for i, item in ipairs(harpoon_files.items) do
					table.insert(results, { value = item.value, index = i })
				end

				-- Path fills the width; the (0-based) number is right-justified
				-- at the far right edge of the results window.
				local displayer = entry_display.create({
					separator = " ",
					items = {
						{
							width = function(_, cols)
								return cols - 4
							end,
						},
						{ width = 3, right_justify = true },
					},
				})

				return require("telescope.finders").new_table({
					results = results,
					entry_maker = function(item)
						return {
							value = item.value,
							ordinal = item.value,
							index = item.index,
							display = function()
								return displayer({
									item.value,
									{ tostring(item.index - 1), "TelescopeResultsNumber" },
								})
							end,
						}
					end,
				})
			end
			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					initial_mode = "normal",
					finder = make_finder(),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
					attach_mappings = function(prompt_buffer_number, map)
						local state = require("telescope.actions.state")

						-- Keep the picker in normal mode; block keys that enter insert
						local noop = function() end
						for _, key in ipairs({ "i", "I", "a", "A", "o", "O", "c", "C" }) do
							map("n", key, noop)
						end

						map("n", "<c-d>", function()
							local selected_entry = state.get_selected_entry()
							local current_picker = state.get_current_picker(prompt_buffer_number)

							harpoon:list():remove(selected_entry)
							current_picker:refresh(make_finder())
						end)

						-- Ctrl+S to mark an item, then Ctrl+S on another to swap the two
						local marked_index = nil
						local function swap()
							local entry = state.get_selected_entry()
							if not entry then
								return
							end
							local index = entry.index

							if marked_index == nil then
								marked_index = index
								print("Harpoon: marked '" .. entry.value .. "' (Ctrl+S another to swap)")
							elseif marked_index == index then
								marked_index = nil
								print("Harpoon: swap cancelled")
							else
								local items = harpoon_files.items
								items[marked_index], items[index] = items[index], items[marked_index]
								print("Harpoon: swapped positions " .. marked_index .. " and " .. index)
								marked_index = nil

								local current_picker = state.get_current_picker(prompt_buffer_number)
								local row = current_picker:get_selection_row()
								current_picker:register_completion_callback(function(self)
									self:set_selection(row)
								end)
								current_picker:refresh(make_finder(), { reset_prompt = false })
							end
						end

						map("n", "s", swap)

						return true
					end,
				})
				:find()
		end

		vim.keymap.set("n", "<leader>hl", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })
	end,
}
