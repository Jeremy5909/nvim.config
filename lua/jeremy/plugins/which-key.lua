return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		delay = 400,
		win = {
			no_overlap = false,
			height = { min = 5, max = 12 },
		},
		spec = {
			{ "<leader>c", group = "code/LSP" },
			{ "<leader>f", group = "find" },
			{ "<leader>g", group = "git" },
			{ "<leader>m", group = "molten" },
			{ "<leader>t", group = "telescope" },
			{ "<leader>u", group = "fun" },
			{ "<leader>v", group = "splits" },
			{ "<leader>w", group = "session" },
		},
	},
}
