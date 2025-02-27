return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {

			"nvim-neotest/nvim-nio", -- Add Nvim-Nio dependency
			"rcarriga/nvim-dap-ui", -- Add DAP UI dependency
			"mfussenegger/nvim-dap-python", -- Add Python adapter dependency
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local dap_python = require("dap-python")
			-- local dap_vscode = require("dap.ext.vscode")

			local poetry_venv = require("snr2718.utils").get_poetry_venv()
			local python_path = poetry_venv and (poetry_venv .. "/bin/python") or "python"

			dap_python.setup(python_path)

			for _, config in ipairs(dap.configurations.python or {}) do
				if not config.pythonPath or config.pythonPath == "" then
					config.pythonPath = python_path
				end
			end

			-- Setup DAP UI
			dapui.setup()

			-- Automatically open/close UI when debugging starts/ends
			dap.listeners.after.event_initialized["dapui_config"] = function()
				vim.schedule(function()
					dapui.open()
				end)
			end

			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Listen for successful connection events
			dap.listeners.after.event_initialized["notify_connection"] = function()
				print("[DAP] Successfully connected to the debug server!")
			end

			-- Keybindings for Python debugging
			vim.keymap.set("n", "<Leader>dpr", function()
				dap_python.test_method()
			end, { desc = "Run Python test method" })

			vim.keymap.set("n", "<Leader>dpc", function()
				dap_python.debug_selection()
			end, { desc = "Debug selected Python code" })

			-- Keybindings for DAP UI
			vim.keymap.set("n", "<Leader>du", function()
				dapui.toggle()
			end, { desc = "Toggle DAP UI" })

			-- Keybindings for DAP
			vim.keymap.set("n", "<Leader>ds", function()
				dap.continue()
			end, { desc = "Start/Continue debugging" })
			vim.keymap.set("n", "<Leader>dn", function()
				dap.step_over()
			end, { desc = "Step Over" })
			vim.keymap.set("n", "<Leader>di", function()
				dap.step_into()
			end, { desc = "Step Into" })
			vim.keymap.set("n", "<Leader>do", function()
				dap.step_out()
			end, { desc = "Step Out" })
			vim.keymap.set("n", "<Leader>db", function()
				dap.toggle_breakpoint()
			end, { desc = "Toggle Breakpoint" })
			vim.keymap.set("n", "<Leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Set Conditional Breakpoint" })
			vim.keymap.set("n", "<Leader>de", function()
				local session = dap.session()
				if session then
					if session.config.request == "attach" then
						print("[DAP] Detaching from the debug server.")
						dap.disconnect()
					else
						print("[DAP] Terminating the debug session.")
						dap.terminate()
					end
				else
					print("[DAP] No active debug session.")
				end
			end, { desc = "End debugging session (terminate or detach)" })
		end,
	},
}
