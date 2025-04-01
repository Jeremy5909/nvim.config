return {
	"eandrju/cellular-automaton.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>uu", "<cmd>CellularAutomaton make_it_rain<CR>", desc = "Make it rain" },
		{ "<leader>ui", "<cmd>CellularAutomaton game_of_life<CR>", desc = "Game of life" },
		{ "<leader>uo", "<cmd>CellularAutomaton scramble<CR>", desc = "Scramble" },
	},
}
