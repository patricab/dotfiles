vim.g.mapleader = " "

-- Utils
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "W", vim.cmd.w)
vim.keymap.set("n", "<leader>q", vim.cmd.so)
vim.keymap.set("n", "<leader>s", function() vim.cmd.so() vim.cmd.PackerSync() end)
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader><tab>", ":e#<CR>") -- Jump to previous file

-- Text processing
vim.keymap.set("n", "Y", "Vy")
vim.keymap.set("n", "oo", "o<Esc>k")
vim.keymap.set("n", "OO", "O<Esc>j")
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.tmux/tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Visual selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Movement
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<M-j>", "}zz")
vim.keymap.set("n", "<M-k>", "{zz")

-- Windows
vim.keymap.set("n", "<C-h>", "<C-w>h") -- Move between splits
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<leader>wm", "<C-w>|") -- Maximize window
vim.keymap.set("n", "<leader>we", "<C-w>=") -- Equalize windows
vim.keymap.set("n", "<leader>wc", "<C-w>o") -- Close all but window
vim.keymap.set("n", "<leader>w/", ":vsp %<CR>") -- Vsplit current split

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
