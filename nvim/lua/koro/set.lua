-- vim configurations
-- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

 vim.opt.guicursor = "" -- fat cursor

-- line number
vim.opt.nu = true
vim.opt.relativenumber = true

-- 4 space indents
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- vim.opt.smartindent = true // bugs

vim.opt.wrap = false

-- no backups and give undotree to have access to very long undos
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- coloumn on the right
--vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

vim.opt.splitbelow = true

-- TODO: remove trailing white space -> https://www.youtube.com/watch?v=HP06nHeYTII
--vim.highlight.create("ExtraWhiteSpace", {ctermbg="red", guibg="red"}, false)

-- show netrw with cascading folders
-- vim.g.netrw_liststyle=3
