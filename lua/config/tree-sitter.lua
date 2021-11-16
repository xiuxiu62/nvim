local M = {}

function M.setup()
    local nvim_treesitter = require "nvim-treesitter.configs"

    nvim_treesitter.setup {
        highlight = {
            enable = true,
            disable = {},
        },
        indent = {
            enable = false,
            disable = {},
        },
        ensure_installed = {
            "fish",
            "html",
            "json",
            "lua",
            "php",
            "rust",
            "scss",
            "tsx",
            "toml",
            "yaml",
        },
    }
end

return M
