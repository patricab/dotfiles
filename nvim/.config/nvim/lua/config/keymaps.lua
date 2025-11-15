-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Move to top, middle, bottom of the screen (customized)
-- ~/.config/nvim/lua/config/keymaps.lua
--
--
vim.keymap.set("n", "H", "H", { desc = "Go to top of screen" })
vim.keymap.set("n", "M", "M", { desc = "Go to middle of screen" })
vim.keymap.set("n", "L", "L", { desc = "Go to bottom of screen" })
-- vim.keymap.set("n", "W", ":w<cr>")
vim.keymap.set("n", "<leader>q", ":so ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader><tab>", ":e#<CR>") -- Jump to previous file
vim.keymap.set("n", "<leader>e", ":Explore<CR>") -- Netrw baby
vim.keymap.del("n", "s")
vim.keymap.del("n", "S")

-- Text processing
vim.keymap.set("n", "Y", "Vy")
vim.keymap.set("n", "oo", "o<Esc>k")
vim.keymap.set("n", "OO", "O<Esc>j")
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.tmux/tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("x", "<leader>p", [["0p]])

-- Refactor hover
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Visual selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Movement
-- vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "}")
vim.keymap.set("n", "K", "{")
vim.keymap.set("n", "[c", function()
    require("treesitter-context").go_to_context()
end, { silent = true })

-- Windows
-- vim.keymap.set("n", "<leader>wm", "<C-w>|") -- Maximize window
-- vim.keymap.set("n", "<leader>we", "<C-w>=") -- Equalize windows
-- vim.keymap.set("n", "<leader>wc", "<C-w>o") -- Close all but window
vim.keymap.set("n", "<leader>w/", ":vsp %<CR><C-w>l") -- Vsplit current split

vim.keymap.set("n", "<M-j>", ":GitGutterNextHunk<CR>") -- Vsplit current split
vim.keymap.set("n", "<M-k>", ":GitGutterPrevHunk<CR>") -- Vsplit current split
