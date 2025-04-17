return {
	"benlubas/molten-nvim",
	version = "^1.0.0",
	build = ":UpdateRemotePlugins",
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

		vim.keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>", { silent = true, desc = "Evaluate line" })
		vim.keymap.set("n", "<leader>mm", ":MoltenReevaluateCell<CR>", { silent = true, desc = "Re-evaluate cell" })
		vim.keymap.set(
			"v",
			"<leader>mm",
			":<C-u>MoltenEvaluateVisual<CR>",
			{ silent = true, desc = "evaluate visual selection" }
		)
		vim.keymap.set("n", "<leader>mx", ":MoltenDelete<CR>", { silent = true, desc = "molten delete cell" })
		vim.keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>", { silent = true, desc = "hide output" })

		vim.api.nvim_create_autocmd("User", {
			pattern = "MoltenDeinitPre",
			callback = function()
				vim.cmd("MoltenSave")
			end,
		})
	end,
}
