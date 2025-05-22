return {
	"nvim-lua/plenary.nvim",
	"christoomey/vim-tmux-navigator",
	"tpope/vim-fugitive",
	"vuciv/golf",
	{ "echasnovski/mini.ai", version = false, config = true },
	{ "kylechui/nvim-surround", event = "VeryLazy", config = true },
	{
		"3rd/image.nvim",
		dependencies = {
			{ "vhyrro/luarocks.nvim", priority = 1001, opts = { rocks = "magick" } },
		},
		opts = true,
	},
}
