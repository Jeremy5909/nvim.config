return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mfussenegger/nvim-jdtls",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- tell every server what nvim-cmp supports (snippets, resolve, etc.)
		vim.lsp.config("*", {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		vim.lsp.enable("jdtls")

		vim.lsp.inlay_hint.enable(true)

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
		vim.lsp.config("rust_analyzer", {
			settings = {
				["rust-analyzer"] = {
					check = { command = "clippy" },
				},
			},
		})
	end,
}
