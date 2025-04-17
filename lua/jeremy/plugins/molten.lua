return {
	"benlubas/molten-nvim",
	version = "^1.0.0",
	build = ":UpdateRemotePlugins",
	init = function()
		vim.g.molten_image_provider = "image.nvim"
		vim.g.python3_host_prog = vim.fn.expand("~/.venv/neovim/bin/python3")

		-- Automatically launch correct kernel
		vim.keymap.set("n", "<leader>ip", function()
			local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
			if venv ~= nil then
				-- in the form of /home/benlubas/.virtualenvs/VENV_NAME
				venv = string.match(venv, "/.+/(.+)")
				vim.cmd(("MoltenInit %s"):format(venv))
			else
				vim.cmd("MoltenInit python3")
			end
		end, { desc = "Initialize Molten for python3", silent = true })
	end,
}
