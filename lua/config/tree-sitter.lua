local M = {}

function M.setup()
    require('nvim-treesitter.configs').setup {
      highlight = {
        enable = true,
        disable = {},
      },
      indent = {
        enable = false,
        disable = {},
      },
      ensure_installed = {
        "tsx",
        "toml",
        "fish",
        "php",
        "json",
        "yaml",
        "swift",
        "html",
        "scss"
      },
    }
end

return M
