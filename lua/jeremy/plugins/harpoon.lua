return {
	"ThePrimeagen/harpoon",
	config = function()
		local ui = require("harpoon.ui")
		local mark = require("harpoon.mark")

		vim.keymap.set("n", "<leader>hj", function()
			ui.toggle_quick_menu()
		end, { desc = "Open harpoon menu" })

		vim.keymap.set("n", "<leader>hh", function()
			mark.add_file()
		end, { desc = "Add file to harpoon" })

		-- Navigation
		vim.keymap.set("n", "C-h", function()
			ui.nav_file(1)
		end)
		vim.keymap.set("n", "C-j", function()
			ui.nav_file(1)
		end)
		vim.keymap.set("n", "C-k", function()
			ui.nav_file(1)
		end)
		vim.keymap.set("n", "C-l", function()
			ui.nav_file(1)
		end)
	end,
}
