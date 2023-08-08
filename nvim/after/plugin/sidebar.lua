# https://github.com/sidebar-nvim/sidebar.nvim

require("sidebar-nvim").setup({
    disable_default_keybindings = 0,
    bindings = nil,
    open = false,
    side = "left",
    initial_width = 35,
    hide_statusline = false,
    update_interval = 2000,
    sections = {
        "files",
        --"git"
    },
    section_separator = {"", "-----", ""},
    section_title_separator = {""},
    containers = {
        attach_shell = "/bin/zsh", show_all = true, interval = 5000,
    },
    datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
    todos = { ignored_paths = { "~" } },
})


vim.keymap.set("n", "<leader>si", function()
    require("sidebar-nvim").toggle()

    -- focus bar if opening
    if not (require("sidebar-nvim").get_width() == -1) then
        require("sidebar-nvim").focus()
    end
end) -- open and close

