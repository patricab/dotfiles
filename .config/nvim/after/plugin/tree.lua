-- vim.keymap.set("n", "<Tab>", nvim-tree-api.node.open.preview)
vim.keymap.set("n", "<A-0>", vim.cmd.NvimTreeToggle)
--
-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
