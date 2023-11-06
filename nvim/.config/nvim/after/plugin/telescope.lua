local builtin = require('telescope.builtin')
require("telescope").load_extension("git_worktree")

vim.keymap.set('n', "<leader>ff", builtin.find_files, {})
-- vim.keymap.set('n', "<leader>fg", builtin.live_grep, {})
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
