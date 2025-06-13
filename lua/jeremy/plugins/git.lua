return {
	"tpope/vim-fugitive",
	keys = {
		{ "<leader>gw", "<cmd>Gw<CR>", desc = "git add {current file}" },
		{ "<leader>gs", "<cmd>G status<CR>", desc = "git status" },
		{ "<leader>ga", "<cmd>G add .<CR>", desc = "git add ." },
		{ "<leader>gp", "<cmd>G push<CR>", desc = "git push" },
		{ "<leader>gc", "<cmd>G commit<CR>", desc = "git commit" },
		{ "<leader>gl", "<cmd>G log<CR>", desc = "git log" },
	},
}
