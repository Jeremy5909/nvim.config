return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
  opts = {
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
  },
  -- config = function(_, opts) 
  --   require("nvim-treesitter.configs").setup(opts)
  -- end
  
}
