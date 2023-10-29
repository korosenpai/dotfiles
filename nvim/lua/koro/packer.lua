-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use { "ellisonleao/gruvbox.nvim" } -- gruvbox colorscheme

    use( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} )
    use('nvim-treesitter/playground') -- run with 'TSPlaygroundToggle'

    --TODO: https://www.youtube.com/watch?v=FuYQ7M73bC0
    --use({
    --  "nvim-treesitter/nvim-treesitter-textobjects",
    --  after = "nvim-treesitter",
    --  requires = "nvim-treesitter/nvim-treesitter",
    --})



    use('m4xshen/autoclose.nvim')

    use('theprimeagen/harpoon')

    use('mbbill/undotree')

    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    use('vim-airline/vim-airline')
    use('vim-airline/vim-airline-themes')
    use('morhetz/gruvbox')

    use("lukas-reineke/indent-blankline.nvim")

    use("sidebar-nvim/sidebar.nvim")

    use("folke/todo-comments.nvim")

    use ({"ziontee113/color-picker.nvim",
    config = function()
        require("color-picker")
    end,
    })

    use ({"norcalli/nvim-colorizer.lua"})

    --use {
    --  "startup-nvim/startup.nvim",
    --  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    --  config = function()
    --    require"startup".setup()
    --  end
    --}
    
    --https://github.com/goolord/alpha-nvim
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    }


    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
    end}


    use {
        'vimwiki/vimwiki',
        config = function()
          vim.g.vimwiki_list = {
            {
              path = '~/vimwiki',
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

    -- https://github.com/iamcco/markdown-preview.nvim
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
        setup = function ()
            -- TODO: fix browser not opening in firefox
            vim.g.mkdp_browser = { "/usr/bin/firefox" }
        end
    })

end)

-- plugin manager can be run with PackerSync


