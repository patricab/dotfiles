require('plugins')
require('remap')
-- Colorscheme
vim.cmd[[colorscheme dracula]]
--
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Settings
vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.guicursor = ""

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.cmd[[colorscheme dracula]]

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

