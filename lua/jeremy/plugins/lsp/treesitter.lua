-- nvim-treesitter `main` branch: it only installs parsers/queries.
-- Highlighting and indent are enabled per buffer below (the old
-- `highlight`/`indent`/`auto_install` options no longer exist).
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		{ "windwp/nvim-ts-autotag", opts = {} },
	},
	config = function()
		local ts = require("nvim-treesitter")
		ts.setup()

		-- the main branch compiles parsers with the tree-sitter CLI
		local can_install = vim.fn.executable("tree-sitter") == 1
		if not can_install then
			vim.schedule(function()
				vim.notify(
					"nvim-treesitter: `tree-sitter` CLI not found, parsers can't be installed (brew install tree-sitter-cli)",
					vim.log.levels.WARN
				)
			end)
		end

		if can_install then ts.install({
			"bash", "c", "cpp", "css", "html", "java", "javascript", "json", "lua",
			"markdown", "markdown_inline", "python", "rust", "svelte", "toml",
			"tsx", "typescript", "vim", "vimdoc", "yaml",
		}) end

		local available = nil
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("UserTreesitter", {}),
			callback = function(ev)
				local lang = vim.treesitter.language.get_lang(ev.match)
				if not lang then
					return
				end

				local function start()
					if not vim.api.nvim_buf_is_valid(ev.buf) then
						return
					end
					if pcall(vim.treesitter.start, ev.buf, lang) then
						vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end

				if vim.treesitter.language.add(lang) then
					start()
					return
				end

				-- auto-install parsers for languages we haven't installed yet
				if not can_install then
					return
				end
				available = available or ts.get_available()
				if vim.tbl_contains(available, lang) then
					ts.install(lang):await(function()
						vim.schedule(start)
					end)
				end
			end,
		})
	end,
}
