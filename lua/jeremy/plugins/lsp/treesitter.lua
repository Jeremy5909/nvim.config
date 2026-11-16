return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		{ "windwp/nvim-ts-autotag", opts = {} },
	},
	config = function()
		require("nvim-treesitter").install({
			"bash", "c", "cpp", "css", "html", "java", "javascript", "json", "lua",
			"markdown", "markdown_inline", "python", "rust", "svelte", "toml",
			"tsx", "typescript", "vim", "vimdoc", "yaml",
		})

		-- turn on highlight + indent for any filetype that has a parser
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				if pcall(vim.treesitter.start) then
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
