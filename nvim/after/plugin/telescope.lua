local builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-p>', builtin.find_files, {}) -- all file search
vim.keymap.set('n', '<leader>pf', builtin.git_files, {})       -- git file search with ctrl + p
--vim.keymap.set('n', '<C-s>', function()
--    builtin.grep_string({ search = vim.fn.input("Grep > ")})
--end) -- project search
vim.keymap.set("n", "<C-s>", builtin.live_grep, {})


-- https://github.com/ahmedkhalf/project.nvim
require'telescope'.load_extension('project') -- will be used by alpha.nvim
-- c -> create project
-- d -> delete project
-- f ->> find files in a project


require('telescope').setup{
    defaults = {
        file_ignore_patterns = {
            "node_modules",
            "objs" -- for c compiled files
        }
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            -- even more opts
            }
        }
    }
}

require("telescope").load_extension("ui-select")
