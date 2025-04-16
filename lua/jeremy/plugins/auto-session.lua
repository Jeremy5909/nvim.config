return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		{ "<leader>wr", "<cmd>SessionSearch<CR>", desc = "Session search" },
		{ "<leader>ws", "<cmd>SessionSave<CR>", desc = "Save session" },
		{ "<leader>wa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
	},
	---@modules "auto-session"
	---@type AutoSession.Config
	opts = {
		auto_save = true,
		auto_create = true,
		lazy_support = true,
		suppressed_dirs = { "~/Projects", "~/Downloads", "/", "~/" },
	},
}
