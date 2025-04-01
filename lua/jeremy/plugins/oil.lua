return {
	"stevearc/oil.nvim",
	---@module "oil",
	---@type oil.SetupOpts
	opts = {},
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	lazy = false,
	keys = {
		{ "-", "<CMD>Oil --float<Cr>", { desc = "Open parent directory" } },
	},
	config = function()
		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			view_options = {
				show_hidden = true,
				natural_order = true,
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git" or name == ".DS_STORE"
				end,
			},
			win_options = {
				wrap = true,
			},
			float = {
				padding = 5,
			},
		})
	end,
}
