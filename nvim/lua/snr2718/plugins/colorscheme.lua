local function select_colorscheme(scheme)
	local colorschemes = {
		gruvbox = {
			"morhetz/gruvbox",
			name = "gruvbox",
			config = function()
				vim.cmd("colorscheme gruvbox")
				vim.cmd("highlight MatchParen guibg=red ctermbg=red")
			end,
		},
		kanagawa = {
			"rebelot/kanagawa.nvim",
			name = "kanagawa",
			config = function()
				require("kanagawa").setup({
					overrides = function()
						return {
							Visual = { bg = "#3B5B6E" },
						}
					end,
				})
				vim.cmd("colorscheme kanagawa")
			end,
		},
		tokyonight = {
			"folke/tokyonight.nvim",
			name = "tokyonight",
			config = function()
				vim.cmd("colorscheme tokyonight")
			end,
		},
		nightfox = {
			"EdenEast/nightfox.nvim",
			name = "nightfox",
			config = function()
				vim.cmd("colorscheme nightfox")
			end,
		},
	}

	local selected = colorschemes[scheme]
	if selected then
		return { selected }
	else
		error("Invalid colorscheme: " .. scheme)
	end
end

-- Example Usage:
return select_colorscheme("nightfox") -- Change to your preferred colorscheme
