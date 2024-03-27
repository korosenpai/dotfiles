vim.g.mapleader = " " -- is <leader> --> setupped in set.lua
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- press "space + pv" to execute ":Ex"

-- move lines up and down -> in vscode shift + alt + up / down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z") -- append line below current line and adds space
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- jump up and down file while maintaining cursor in current coloumn
vim.keymap.set("n", "<C-u>", "<C-u>zz") ----^
vim.keymap.set("n", "n", "nzzzv") -- move up and down search terms
vim.keymap.set("n", "N", "Nzzzv") ----^

--vim.keymap.set("n", "<leader>vwm", function()
--    require("vim-with-me").StartVimWithMe()
--end)
--vim.keymap.set("n", "<leader>svwm", function()
--    require("vim-with-me").StopVimWithMe()
--end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]]) -- paste over string while maintaining original string copied

-- next greatest remap ever : asbjornHaland
-- <leader y> enter +y mode -> copy something -> like ap for paragraph and it saves in system clipboard
-- also like highlight something with v the leader y to copy it
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
--vim.keymap.set("n", "<leader>Y", [["+Y]]) -- leader y == leader Y

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]]) -- delete to void register

-- This is going to get me cancelled
vim.keymap.set("i", "jk", "<Esc>")

--vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>") -- switch session --TODO
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quick fix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace word you are on on entire file
-- to change only in selection, in visual mode press ":" -> it will give "'<,'>" just add ""s/old_word/new_word"
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- make file executable

--vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/.config/nvim/lua/koro/packer.lua<CR>");
--vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

--vim.keymap.set("n", "<leader><leader>", function()
--    vim.cmd("so")
--end)

-- ctrl a to select everything (as other ides)
vim.keymap.set("n", "<C-a>", "gg<S-v>G");

-- open and close markdown preview
vim.keymap.set("n", "<leader>ma", ":MarkdownPreview <CR>")
vim.keymap.set("n", "<leader>mas", ":MarkdownPreviewStop <CR>")

-- wrap and unwrap lists
vim.keymap.set("n", "<leader>w", ":set wrap <CR>")
vim.keymap.set("n", "<leader>nw", ":set nowrap <CR>")

-- close current buffer without saving
--vim.keymap.set("n", "<C-q>", ":bd!<CR>")
vim.keymap.set("n", "Q", ":bd!<CR>")
vim.keymap.set("n", "<leader><PageUp>", ":bnext<CR>")
vim.keymap.set("n", "<leader><PageDown>", ":bprev<CR>")

-- move to dir of current file
vim.keymap.set("n", "<leader>cd", ":cd %:h <CR> :echo 'moved in: ' getcwd() <CR>")

-- keep lines selected after indenting
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set({"n", "i"}, "<C-o>", "<Esc>:Telescope buffers <CR>") -- show open buffers

-- TODO: run java packages
-- echo ${$(grep package TestD.java)%;} | awk {'print $2'}

-- run any file supported with a single command
vim.api.nvim_create_user_command("RunFile",function()
    local filename = vim.fn.expand("%")
    local ext = filename:match("^.+%.(.+)$") or "" -- if file has no extension assign to "" and not nil

    -- move to current file to be able to be in correct dir
    vim.api.nvim_command("cd %:h")

    local ext_table = {
        [ "py" ] = "!python3 %",
        [ "java" ] = "!javac -d out/ ./% && java -cp ./out/ %:t:r", -- %:t:r -> gets filename, then tail, then removes tail
        [ "c" ] = "![ -f 'Makefile' ] && make || gcc -o %:t:r % && ./%:t:r",
        [ "sh" ] = "!./%",
        [ "" ] = "![ -x % ] && ./% || echo 'file or folder not executable'" -- check if file is an executable and not dir before running
    }
    local choice = ext_table[ext]

    if (choice) then
        vim.api.nvim_command(choice)
    else
        print("file extension not recognized")
    end


end,{})

vim.keymap.set("n", "<leader>r", ":RunFile <CR>") -- execute file if possible
