local M = {}

--require('config.sumneko.lua').setup()
--require('config.symbols-outline')

function M.setup()
    require('packer').startup(function(use)
        -- Packer can manage itself
        use('wbthomason/packer.nvim')

        ----------------
        -- UI modules --
        ----------------
        -- Color theme
        use('tanvirtin/monokai.nvim')
        -- Status line
        use {
            'glepnir/galaxyline.nvim',
            config = function() require('config.galaxyline').setup() end
        }
        use('hoob3rt/lualine.nvim')
        -- Top buffer/tab line
        use {
            'akinsho/nvim-bufferline.lua',
            config = function() require('config.bufferline').setup() end
        }
        -- Inline git tags
        use {
            'lewis6991/gitsigns.nvim',
            config = function() require('config.gitsigns').setup() end
        }
        -- File explorer
        use {
            'Shougo/defx.nvim',
            run = ':UpdateRemotePlugins'
        }
        use('kristijanhusak/defx-git')
        use('kristijanhusak/defx-icons')
        -- Dev icons
        use('kyazdani42/nvim-web-devicons')
        -- LSP UI overrides
        use('RishabhRD/popfix')
        use('folke/lsp-colors.nvim')
        use('RishabhRD/nvim-lsputils')
        -- Show a popup with signature info
        use('ray-x/lsp_signature.nvim')
        -- Pretty diagnostics
        use('folke/trouble.nvim')
        -- Colorize hex and rgb values
        use {
            'norcalli/nvim-colorizer.lua',
            config = function() require('config.colorizer').setup() end
        }
        -- Show buffer line indents
        use {
            'lukas-reineke/indent-blankline.nvim',
            config = function() require('config.indent-blankline').setup() end
        }

        -----------------------
        -- Telescope modules --
        -----------------------
        use('nvim-lua/plenary.nvim')
        use('nvim-lua/popup.nvim')
        use {
            'nvim-telescope/telescope.nvim',
            config = function()  require('config.telescope').setup() end
        }
        use('romgrk/fzy-lua-native')
        use('nvim-telescope/telescope-fzy-native.nvim')

        -----------------
        -- Dev modules --
        -----------------
        -- Lsp
        use {
            'neovim/nvim-lspconfig',
            config = function() require('config.lsp').setup() end
        }
        use('glepnir/lspsaga.nvim')
        use('jose-elias-alvarez/null-ls.nvim')
        -- Completion
        use {
            'hrsh7th/nvim-cmp',
            config = function() require('config.cmp').setup() end
        }
        use('hrsh7th/cmp-nvim-lsp')
        use('hrsh7th/cmp-buffer')
        -- Tree sitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate',
            config = function() require('config.tree-sitter').setup() end
        }
        use('nvim-treesitter/playground')
        use('windwp/nvim-ts-autotag')
        use('JoosepAlviste/nvim-ts-context-commentstring')
        -- Lua
        use('ckipp01/stylua-nvim')
        -- Typescript
        use('jose-elias-alvarez/nvim-lsp-ts-utils')
        -- Rust
        use {
            'simrat39/rust-tools.nvim',
            config = function() require('config.rust-tools').setup() end
        }
        use {
            'Saecki/crates.nvim',
            requires = { { 'nvim-lua/plenary.nvim' } },
            config = function() require('config.crates').setup() end
        }
        -- Debugging
        use('mfussenegger/nvim-dap')
        use {
            'rcarriga/nvim-dap-ui',
            config = function() require('config.dap-ui').setup() end
        }

        ------------------
        -- Misc modules --
        ------------------
        -- Snippets
        use('hrsh7th/vim-vsnip')
        -- Ranger
        use({ 'kevinhwang91/rnvimr', run = ':make sync' })
        -- File tree
        use('kyazdani42/nvim-tree.lua')
        -- Comment stuff out
        use('tpope/vim-commentary')
        -- Auto pairs
        use {
            'windwp/nvim-autopairs',
            requires = { { 'nvim-lua/plenary.nvim' } },
            config = function()
                require('config.autopairs').setup()
            end
        }
        -- Startify
        use('mhinz/vim-startify')
        -- Which key
        use('liuchengxu/vim-which-key')
        -- Git
        use('tpope/vim-fugitive')
        -- Discord
        use('andweeb/presence.nvim')
        -- Desktop notifications
        --use('simrat39/desktop-notify.nvim')
    end)
end

return M
