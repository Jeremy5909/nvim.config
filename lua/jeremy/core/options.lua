vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.nu = true
opt.relativenumber = true

-- tab and indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.softtabstop = 2
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- search settings
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true -- if mixed casing, case sensetive

-- highlight current line
opt.cursorline = true

-- colors
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, eol, or insert mode start position

opt.scrolloff = 8
-- opt.isfname:append("@-@") -- what is this?

opt.updatetime = 50
