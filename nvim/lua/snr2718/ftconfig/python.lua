local function get_poetry_venv()
	-- Check if `pyproject.toml` exists
	if vim.fn.filereadable("pyproject.toml") == 0 then
		return nil -- No Poetry project, use system Python
	end

	-- Get Poetry virtual environment path

	local handle = io.popen("poetry env info --path 2>/dev/null")
	if handle then
		local venv_path = handle:read("*l")
		handle:close()
		if venv_path and venv_path ~= "" then
			return venv_path
		end
	end

	return nil -- Fallback if Poetry env isn't found
end

local poetry_venv = get_poetry_venv()
if poetry_venv then
	local poetry_bin = poetry_venv .. "/bin"

	-- Set Python host for Neovim
	vim.g.python3_host_prog = poetry_bin .. "/python"

	-- Prepend Poetry's virtual environment bin directory to PATH
	vim.env.PATH = poetry_bin .. ":" .. vim.env.PATH

	print("Using Poetry virtual environment: " .. poetry_bin)
else
	print("No Poetry environment found. Using system Python.")
end
