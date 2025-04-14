-- https://github.com/akinsho/toggleterm.nvim

require("toggleterm").setup{
    size = 20 or function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,


    open_mapping = [[<c-\>]],
    shade_terminals = true,
    close_on_exit = true,
    shell = vim.o.shell,
    auto_scroll = true,
    start_in_insert = true,
    terminal_mappings = true,
    direction = "float", -- vertical, horizontal, tab, float
}
