-- https://github.com/goolord/alpha-nvim

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {

    [[███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
    [[████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
    [[██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
    [[██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
    [[██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
    [[╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
    [[]],
    [[      　　／⌒ヽ  ／⌒ヽ  ／⌒ヽ                     ]],
    [[      ⊂ヽ(　^ω^)つ^ω^)つ^ω^)つ      ／l、   meow? ]],
    [[      　 ＼ 　／　　　／　　／    （ﾟ､ ｡ ７       ]],
    [[      　　( ＿_フ( ＿_フ( ＿_フ     |  ~ヽ        ]],
    [[      　　(／　　(／　　(／         じしf_,)ノ    ]]
}
--TODO: make header red -> #E06C75

dashboard.section.buttons.val = {
	dashboard.button("<C-p>", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("<C-n>", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope project<CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "󱎸  Find text", ":Telescope live_grep <CR>"),
    dashboard.button("<leader>ww", "󱞁  Vimwiki", ":VimwikiIndex <CR> :cd %:h<CR>"), -- cd &:h is to set nvim to that dir so you can easyly use stuff like telescope
	dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR> :cd %:h<CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}


dashboard.section.footer.val = "alpha.nvim"

dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.section.footer.opts.hl = "Type"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)


-- NOTE: concept of art to put
-- https://2ch-aa.blogspot.com/2018/06/625.html
-- https://www.reddit.com/media?url=https%3A%2F%2Fi.redd.it%2Fq9ywpzk0nke81.jpg
-- https://www.deviantart.com/davirus/art/Cute-ASCII-kitty-81918251


--     ／l、   meow?
--   （ﾟ､ ｡ ７
--     |  ~ヽ
--     じしf_,)ノ
--
--    
--　　／⌒ヽ  ／⌒ヽ  ／⌒ヽ
--⊂ヽ(　^ω^)つ^ω^)つ^ω^)つ
--　 ＼ 　／　　　／　　／
--　　( ＿_フ( ＿_フ( ＿_フ
--　　(／　　(／　　(／

--　　／⌒ヽ  ／⌒ヽ  ／⌒ヽ  
--⊂ヽ(　^ω^)つ^ω^)つ^ω^)つ      ／l、   meow?
--　 ＼ 　／　　　／　　／    （ﾟ､ ｡ ７
--　　( ＿_フ( ＿_フ( ＿_フ     |  ~ヽ
--　　(／　　(／　　(／         じしf_,)ノ

