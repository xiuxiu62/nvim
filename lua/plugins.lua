local packer = require('packer')

packer.startup(function(use)
    -- Packer can manage itself
    use('wbthomason/packer.nvim')

    ----------------
    -- UI modules --
    ----------------
    -- Color theme
    use('tanvirtin/monokai.nvim')
    -- Status line
    use('glepnir/galaxyline.nvim')
    use('hoob3rt/lualine.nvim')
    -- Top buffer/tab line
    use("akinsho/nvim-bufferline.lua")
    -- Inline git tags
	use("lewis6991/gitsigns.nvim")
    -- File explorer
    use({ 'Shougo/defx.nvim', run = ':UpdateRemotePlugins' })
    use('kristijanhusak/defx-git')
    use('kristijanhusak/defx-icons')
    -- Dev icons
    use('kyazdani42/nvim-web-devicons')
    -- LSP UI overrides
	use("RishabhRD/popfix")
    use('folke/lsp-colors.nvim')
	use("RishabhRD/nvim-lsputils")
	-- Show a popup with signature info
	use("ray-x/lsp_signature.nvim")
	-- Pretty diagnostics
	use("folke/trouble.nvim")
    -- Colorize hex and rgb values
	use("norcalli/nvim-colorizer.lua")
    -- Show buffer line indents
	use("lukas-reineke/indent-blankline.nvim")
    
    -----------------------
	-- Telescope modules --
    -----------------------
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" }, { "nvim-lua/popup.nvim" } },
	})
	use({
		"romgrk/fzy-lua-native",
		requires = { { "nvim-telescope/telescope.nvim" } },
	})
	use({
		"nvim-telescope/telescope-fzy-native.nvim",
		requires = { { "nvim-telescope/telescope.nvim" } },
	})

    -----------------
    -- Dev modules --
    -----------------
    -- Lsp
    use('neovim/nvim-lspconfig')
    use('glepnir/lspsaga.nvim')
	use("jose-elias-alvarez/null-ls.nvim")
    -- Completion
    use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
    -- Tree sitter
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use("nvim-treesitter/playground")
	use("windwp/nvim-ts-autotag")
	use("JoosepAlviste/nvim-ts-context-commentstring")
    -- Lua
	use("folke/lua-dev.nvim")
	use("ckipp01/stylua-nvim")
    -- Rust
    use('simrat39/rust-tools.nvim')
	-- Debugging
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

    ------------------
    -- Misc modules --
    ------------------
	-- Snippets
	use("hrsh7th/vim-vsnip")
	-- Ranger
	use({ "kevinhwang91/rnvimr", run = ":make sync" })
    -- File tree
	use("kyazdani42/nvim-tree.lua")
	-- Comment stuff out
	use("tpope/vim-commentary")
    -- Auto pairs
	use("windwp/nvim-autopairs")
    -- Startify
	use("mhinz/vim-startify")
	-- Which key
	use("liuchengxu/vim-which-key")
	-- Git
	use("tpope/vim-fugitive")
    -- Discord
	use("andweeb/presence.nvim")
    -- Desktop notifications
    use('simrat39/desktop-notify.nvim')
end)
