return {
	"echasnovski/mini.diff",
	version = "*",
	config = function()
		local MiniDiff = require("mini.diff")
		MiniDiff.setup({})
		vim.keymap.set("n", "<leader>q", function()
			MiniDiff.toggle_overlay()
		end, { desc = "Toggle MiniDiff Overlay" })
	end,
}
