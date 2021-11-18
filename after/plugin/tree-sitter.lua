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
    "bash",
    "c",
    "c_sharp",
    "cmake",
    "cpp",
    "css",
    "dart",
    "glsl",
    "go",
    "haskell",
    "html",
    "http",
    "javascript",
    "json",
    "json5",
    "lua",
    "ocaml",
    "ocaml_interface",
    "php",
    "python",
    "query",
    "rust",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vue",
    "yaml",
  },
}
