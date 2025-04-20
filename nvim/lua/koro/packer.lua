-- This file can be loaded by calling `lua require('plugins')` from your init.vim


-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer can manage itself

    use {
        'williamboman/mason.nvim',
    }
    use {'neovim/nvim-lspconfig'}
    use("williamboman/mason-lspconfig.nvim")
    use('hrsh7th/nvim-cmp')
    use("hrsh7th/cmp-nvim-lsp")
    -- use{'L3MON4D3/LuaSnip'}

    -- use {
    --     'VonHeikemen/lsp-zero.nvim',
    --     branch = 'v3.x',
    --     requires = {
    --         -- LSP Support
    --         {'neovim/nvim-lspconfig'},             -- Required
    --         {                                      -- Optional
    --             'williamboman/mason.nvim',
    --             run = function()
    --                 pcall(vim.cmd, 'MasonUpdate')
    --             end,
    --         },
    --         {'williamboman/mason-lspconfig.nvim'}, -- Optional

    --         -- Autocompletion
    --         {'hrsh7th/nvim-cmp'},     -- Required
    --         {'hrsh7th/cmp-nvim-lsp'}, -- Required
    --         {'L3MON4D3/LuaSnip'},     -- Required
    --     }
    -- }
    -- use('hrsh7th/nvim-cmp')
    -- use("hrsh7th/cmp-nvim-lsp")

    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.8', -- or branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {'nvim-telescope/telescope-ui-select.nvim'}

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} )
    use('nvim-treesitter/playground') -- run with 'TSPlaygroundToggle'

    -- --TODO: https://www.youtube.com/watch?v=FuYQ7M73bC0
    -- --use({
    -- --  "nvim-treesitter/nvim-treesitter-textobjects",
    -- --  after = "nvim-treesitter",
    -- --  requires = "nvim-treesitter/nvim-treesitter",
    -- --})


    use('m4xshen/autoclose.nvim')

    use('theprimeagen/harpoon')

    use('mbbill/undotree')

    use('tpope/vim-fugitive')

    --use('morhetz/gruvbox')
    use { "ellisonleao/gruvbox.nvim" } -- gruvbox colorscheme

    use('vim-airline/vim-airline')
    use('vim-airline/vim-airline-themes')

    -- TODO: get lsp active client https://github.com/nvim-lualine/lualine.nvim/blob/master/examples/cosmicink.lua
    -- use {
    --   'nvim-lualine/lualine.nvim',
    --   requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    -- }


    use("lukas-reineke/indent-blankline.nvim")

    use("sidebar-nvim/sidebar.nvim")

    use("folke/todo-comments.nvim")

    -- use ({"ziontee113/color-picker.nvim",
    -- config = function()
    --     require("color-picker")
    -- end,
    -- })

    -- -- use ({"norcalli/nvim-colorizer.lua"})

    -- --https://github.com/goolord/alpha-nvim
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    }


    -- -- use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    -- --   require("toggleterm").setup()
    -- -- end}


    use {
        'vimwiki/vimwiki',
        config = function()
          vim.g.vimwiki_list = {
            {
              path = '$HOME/vimwiki',
              syntax = 'markdown',
              ext  = '.md',
            }
          }
          vim.g.vimwiki_ext2syntax = {
            ['.md'] = 'markdown',
            ['.markdown'] = 'markdown',
            ['.mdown'] = 'markdown',
          }
        end
    }

    -- -- https://github.com/iamcco/markdown-preview.nvim
    -- use({
    --     "iamcco/markdown-preview.nvim",
    --     run = function() vim.fn["mkdp#util#install"]() end,
    --     setup = function ()
    --         vim.g.mkdp_browser = "/usr/bin/firefox"
    --     end
    -- })

    -- -- https://github.com/mg979/vim-visual-multi
    -- -- tut: https://www.youtube.com/watch?v=p4D8-brdrZo
    use("mg979/vim-visual-multi")

    -- -- TODO: DEBUGGER
    -- -- https://www.youtube.com/watch?v=lEMZnrC-ST4 -- tutorial
    -- -- use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} } -- https://github.com/rcarriga/nvim-dap-ui
    -- -- use { "theHamsta/nvim-dap-virtual-text" }


    -- -- notebbok
    -- use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }

    -- use{
    --     "folke/noice.nvim",
    --     requires = {
    --          "MunifTanjim/nui.nvim",
    --          -- "rcarriga/nvim-notify",
    --     }
    -- }


end)

-- plugin manager can be run with PackerSync

-- -- You must run this or `PackerSync` whenever you make changes to your plugin configuration
-- -- Regenerate compiled loader file
-- :PackerCompile
-- 
-- -- Remove any disabled or unused plugins
-- :PackerClean
-- 
-- -- Clean, then install missing plugins
-- :PackerInstall
-- 
-- -- Clean, then update and install plugins
-- -- supports the `--preview` flag as an optional first argument to preview updates
-- :PackerUpdate
-- 
-- -- Perform `PackerUpdate` and then `PackerCompile`
-- -- supports the `--preview` flag as an optional first argument to preview updates
-- :PackerSync
-- 
-- -- Show list of installed plugins
-- :PackerStatus
-- 
-- -- Loads opt plugin immediately
-- :PackerLoad completion-nvim ale
