return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {

			"nvim-neotest/nvim-nio", -- Add Nvim-Nio dependency
			"rcarriga/nvim-dap-ui", -- Add DAP UI dependency
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dap.set_log_level("TRACE")

			-- Define the Python adapter for nvim-dap
			dap.adapters.python = {
				type = "server",
				host = "127.0.0.1", -- Match the debugpy host
				port = 50011, -- Match the debugpy port
			}

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
				local session = require("dap").session()
				if session then
					if session.config.request == "attach" then
						print("[DAP] Detaching from the debug server.")

						require("dap").disconnect()
					else
						print("[DAP] Terminating the debug session.")
						require("dap").terminate()
					end
				else
					print("[DAP] No active debug session.")
				end
			end, { desc = "End debugging session (terminate or detach)" })
		end,
	},
}
