
if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "c",
    "c_sharp",
    "clojure",
    "cmake",
    "commonlisp",
    "cpp",
    "css",
    "dart",
    "dockerfile",
    "go",
    "gomod",
    "graphql",
    "html",
    "java",
    "javascript",
    "json",
    "json5",
    "lua",
    "ocaml",
    "python",
    "rust",
    "scss",
    "svelte",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vue",
    "yaml",
    "zig",
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "javascript.jsx", "typescript", "typescript.tsx" }
EOF
