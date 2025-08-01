-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Move to top, middle, bottom of the screen (customized)
-- ~/.config/nvim/lua/config/keymaps.lua
vim.keymap.set("n", "H", "H", { desc = "Go to top of screen" })
vim.keymap.set("n", "M", "M", { desc = "Go to middle of screen" })
vim.keymap.set("n", "L", "L", { desc = "Go to bottom of screen" })
vim.keymap.set("n", "W", ":w<cr>")
