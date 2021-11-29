_ = vim.cmd [[packadd packer.nvim]]
_ = vim.cmd [[packadd vimball]]

-- local has = function(x)
--   return vim.fn.has(x) == 1
-- end

-- local executable = function(x)
--   return vim.fn.executable(x) == 1
-- end

-- local is_wsl = (function()
--   local output = vim.fn.systemlist "uname -r"
--   return not not string.find(output[1] or "", "WSL")
-- end)()

require("packer").startup {
  function(use)
    local local_use = function(first, second, opts)
      opts = opts or {}

      local plug_path, home
      if second == nil then
        plug_path = first
        home = "xiuxiu"
      else
        plug_path = second
        home = first
      end

      if vim.fn.isdirectory(vim.fn.expand("~/plugins/" .. plug_path)) == 1 then
        opts[1] = "~/plugins/" .. plug_path
      else
        opts[1] = string.format("%s/%s", home, plug_path)
      end

      use(opts)
    end

    -- Packer
    use "wbthomason/packer.nvim"
    use "lewis6991/impatient.nvim"

    use "tjdevries/complextras.nvim"
    use "tjdevries/lsp_extensions.nvim"
    use "L3MON4D3/LuaSnip"

    -- Color theme
    use "tanvirtin/monokai.nvim"

    -- Status line
    use "glepnir/galaxyline.nvim"

    -- Top buffer/tab line
    use "akinsho/nvim-bufferline.lua"

    -- Inline git tags
    use "lewis6991/gitsigns.nvim"

    -- File explorer
    use {
      "Shougo/defx.nvim",
      run = ":UpdateRemotePlugins",
    }
    use "kristijanhusak/defx-git"
    use "kristijanhusak/defx-icons"

    -- Dev icons
    use "kyazdani42/nvim-web-devicons"

    -- LSP UI overrides
    use "RishabhRD/popfix"
    use "folke/lsp-colors.nvim"
    use "RishabhRD/nvim-lsputils"

    -- Show a popup with signature info
    use "ray-x/lsp_signature.nvim"

    -- Pretty diagnostics
    use "folke/trouble.nvim"

    -- Colorize hex and rgb values
    use "norcalli/nvim-colorizer.lua"

    -- Buffer line indents
    use "lukas-reineke/indent-blankline.nvim"
    -- Telescope
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-telescope/telescope.nvim"

    use "romgrk/fzy-lua-native"
    use "nvim-telescope/telescope-fzy-native.nvim"

    -- Lsp
    use "neovim/nvim-lspconfig"
    use "wbthomason/lsp-status.nvim"
    -- use {
    --     "ericpubu/lsp_codelens_extensions.nvim",
    --     config = function() require "xiuxiu.config.codelens_extensions".setup() end
    -- }
    --
    -- local_use "extensions.nvim"
    use "onsails/lspkind-nvim"
    -- use "glepnir/lspsaga.nvim"
    -- use "jose-elias-alvarez/null-ls.nvim"

    -- Completion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lsp-document-symbol"
    use "saadparwaiz1/cmp_luasnip"
    use "tamago324/cmp-zsh"

    -- Tree sitter
    local_use("nvim-treesitter", "nvim-treesitter")
    use "nvim-treesitter/playground"
    use "windwp/nvim-ts-autotag"
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Lua
    -- use "ckipp01/stylua-nvim"

    -- Typescript
    use "jose-elias-alvarez/nvim-lsp-ts-utils"

    -- Rust
    use "simrat39/rust-tools.nvim"
    use "Saecki/crates.nvim"

    -- Debugging
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"

    -- HTTP client
    use {
      "NTBBloodbath/rest.nvim",
      ft = "http",
      requires = { "nvim-lua/plenary.nvim" },
    }

    -- Snippets
    use "hrsh7th/vim-vsnip"

    -- File tree
    use "kyazdani42/nvim-tree.lua"

    -- Comment stuff out
    use "tpope/vim-commentary"

    -- Auto pairs
    use "windwp/nvim-autopairs"

    -- Startify
    use "mhinz/vim-startify"

    -- Which key
    use "liuchengxu/vim-which-key"

    -- Git
    use "tpope/vim-fugitive"
  end,
}
