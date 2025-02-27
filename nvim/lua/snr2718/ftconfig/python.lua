local poetry_venv = require("snr2718.utils").get_poetry_venv()
if poetry_venv then
	local poetry_bin = poetry_venv .. "/bin"
	vim.g.python3_host_prog = poetry_bin .. "/python"
	vim.env.PATH = poetry_bin .. ":" .. vim.env.PATH
end
