return {
	"benlubas/molten-nvim",
	version = "^1.0.0",
	build = ":UpdateRemotePlugins",
	keys = {
		{ "<leader>ml", "<cmd>MoltenEvaluateLine<CR>", desc = "Evaluate line" },
		{ "<leader>mm", "<cmd>MoltenReevaluateCell<CR>", desc = "Re-evaluate cell" },
		{ "<leader>mm", "<cmd><C-u>MoltenEvaluateVisual<CR>", desc = "Evaluate visual selection", mode = "v" },
		{ "<leader>mx", "<cmd>MoltenDelete<CR>", desc = "Delete cell" },
		{ "<leader>mh", "<cmd>MoltenHideOutput<CR>", desc = "Hide output" },
	},
	init = function()
		vim.g.molten_image_provider = "image.nvim"
		vim.g.python3_host_prog = vim.fn.expand("~/.venv/neovim/bin/python3")

		-- Automatically launch correct kernel
		vim.keymap.set({ "n", "v" }, "<leader>mi", function()
			local ok, _ = pcall(function()
				vim.cmd("MoltenLoad")
			end)

			if not ok then
				local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
				if venv ~= nil then
					-- in the form of /home/benlubas/.virtualenvs/VENV_NAME
					venv = string.match(venv, "/.+/(.+)")
					vim.cmd(("MoltenInit %s"):format(venv))
				else
					vim.cmd("MoltenInit python3")
				end
			end
		end, { desc = "Initialize Molten for python3", silent = true })

		vim.api.nvim_create_autocmd("User", {
			pattern = "MoltenDeinitPre",
			callback = function()
				vim.cmd("MoltenSave")
			end,
		})
	end,
}
