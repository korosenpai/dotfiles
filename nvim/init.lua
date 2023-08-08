require("koro")

-- set colorscheme -- set in colors.lua
--vim.o.background = "dark" -- or "light" for light mode
--vim.cmd([[colorscheme gruvbox]])

-- add line numbers
--vim.wo.number = true

local airline_themes = vim.fn.expand('$HOME/.config/nvim/themes/airline.vim')
vim.cmd('source ' .. airline_themes)

