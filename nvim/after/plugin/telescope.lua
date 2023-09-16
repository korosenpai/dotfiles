local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.find_files, {}) -- all file search
vim.keymap.set('n', '<leader>pf', builtin.git_files, {})       -- git file search with ctrl + p
vim.keymap.set('n', '<S-s>', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ")})
end) -- project search
