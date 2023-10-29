--https://github.com/norcalli/nvim-colorizer.lua

-- DEFAULT_OPTIONS = {
--     RGB      = true;         -- #RGB hex codes
--     RRGGBB   = true;         -- #RRGGBB hex codes
--     names    = true;         -- "Name" codes like Blue
--     RRGGBBAA = false;        -- #RRGGBBAA hex codes
--     rgb_fn   = false;        -- CSS rgb() and rgba() functions
--     hsl_fn   = false;        -- CSS hsl() and hsla() functions
--     css      = false;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
--     css_fn   = false;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
--     -- Available modes: foreground, background
--     mode     = 'background'; -- Set the display mode.
-- }

local colorizer = require("colorizer")

local function toggle_colorizer()
    if colorizer.is_buffer_attached() then
        colorizer.detach_from_buffer()
    else
        colorizer.attach_to_buffer()
    end
end

vim.keymap.set("n", "<leader>ct", toggle_colorizer) -- color toggle

--  Attaches to every FileType mode
colorizer.setup {
    "*"; -- highlight all files
    css = {
        css = true;
    }
}


