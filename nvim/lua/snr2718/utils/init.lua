local M = {}
function M.get_poetry_venv()
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

return M
