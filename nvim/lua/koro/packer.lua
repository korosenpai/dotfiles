-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use { "ellisonleao/gruvbox.nvim" } -- gruvbox colorscheme

    use( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} )
    use('nvim-treesitter/playground') -- run with 'TSPlaygroundToggle'

    use('m4xshen/autoclose.nvim')

    use('theprimeagen/harpoon')

    use('mbbill/undotree')

    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
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

    use {
      "startup-nvim/startup.nvim",
      requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
      config = function()
        require"startup".setup()
      end
    }

end)

-- plugin manager can be run with PackerSync


