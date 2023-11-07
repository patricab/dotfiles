local builtin = require('telescope.builtin')
require("telescope").load_extension("git_worktree")

vim.keymap.set('n', "<leader>ff", builtin.find_files, {})
vim.keymap.set('n', "<leader>fg", builtin.live_grep, {})
vim.keymap.set('n', "<leader>fo", builtin.oldfiles, {})
vim.keymap.set('n', "<leader>fk", builtin.keymaps, {})
vim.keymap.set('n', "<leader>fb", builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', "<leader>fc", builtin.commands, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', "<C-o>", builtin.treesitter, {})
vim.keymap.set('n', "<C-p>", builtin.git_files, {})
-- vim.keymap.set('n', "<leader>fs", function()
--     builtin.grep_string({ search = vim.fn.input("Grep > ") })
-- end)

-- Git worktree
vim.keymap.set('n', '<leader>wc', function()
    require('telescope').extensions.git_worktree.create_git_worktree()
end)
vim.keymap.set('n', '<leader>wf', function()
    require('telescope').extensions.git_worktree.git_worktrees()
end)

-- load refactoring Telescope extension
require("telescope").load_extension("refactoring")

vim.keymap.set({"n", "x"},"<leader>rr", function() require('telescope').extensions.refactoring.refactors() end)
--
-- You can also use below = true here to to change the position of the printf
-- statement (or set two remaps for either one). This remap must be made in normal mode.
vim.keymap.set(
    "n",
    "<leader>rp",
    function() require('refactoring').debug.printf({below = false}) end
)

-- Print var

vim.keymap.set({"x", "n"}, "<leader>rv", function() require('refactoring').debug.print_var() end)
-- Supports both visual and normal mode

vim.keymap.set("n", "<leader>rc", function() require('refactoring').debug.cleanup({}) end)
-- Supports only normal mode
