vim.g.mapleader = " "
local k = vim.keymap

-- Move highlighted text
k.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted text up" })
k.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted text down" })

-- Better combining
k.set("n", "J", "mzJ`z", { desc = "Better combining" })

-- Window management
k.set("n", "<leader>v", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
k.set("n", '<leader>v"', "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
k.set("n", "<leader>v=", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
k.set("n", "<leader>vx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Tabs
k.set("n", "<C-t>", "<cmd>tabnew<CR>", { desc = "Open new tab" })
k.set("n", "<C-x>", "<cmd>tabclose<CR>", { desc = "Close current tab" })
k.set("n", "<C-o>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
k.set("n", "<C-i>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

k.set("n", "L", "<cmd>Lazy<CR>", { desc = "Open Lazy" })

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }

		opts.desc = "Show LSP references"
		k.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

		opts.desc = "Show LSP definitions"
		k.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

		opts.desc = "Show LSP implementations"
		k.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

		opts.desc = "Show LSP type definitions"
		k.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

		opts.desc = "See available code actions"
		k.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

		opts.desc = "Smart rename"
		k.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		opts.desc = "Show buffer diagnostics"
		k.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

		opts.desc = "Show line diagnostics"
		k.set("n", "<leader>d", vim.diagnostic.open_float, opts)

		opts.desc = "Go to previous diagnostic"
		k.set("n", "[d", vim.diagnostic.goto_prev, opts)

		opts.desc = "Go to next diagnostic"
		k.set("n", "]d", vim.diagnostic.goto_next, opts)

		opts.desc = "Show documentation for what is under cursor"
		k.set("n", "K", vim.lsp.buf.hover, opts)

		opts.desc = "Signaturre help"
		k.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

		opts.desc = "Restart LSP"
		k.set("n", "<leader>rs", ":LspRestart<CR>", opts)
	end,
})
