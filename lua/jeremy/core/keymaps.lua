vim.g.mapleader = " "
local k = vim.keymap

-- Move highlighted text
k.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted text up" })
k.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted text down" })

-- Better combining
k.set("n", "J", "mzJ`z", { desc = "Better combining" })

-- Better full page jumping
k.set("n", "<C-d>", "<C-d>zz", { desc = "Better full page jumping up" })
k.set("n", "<C-u>", "<C-u>zz", { desc = "Better full page jumping down" })

-- Better searching
k.set("n", "n", "nzzzv", { desc = "Better searching up" })
k.set("n", "N", "Nzzzv", { desc = "Better searching down" })

-- Unbind evil Q
vim.keymap.set("n", "Q", "<nop>", { desc = "unbind evil q" })

-- Window management
k.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
k.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
k.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
k.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Tabs
k.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
k.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
k.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
k.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
k.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
