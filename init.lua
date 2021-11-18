pcall(require, "impatient")

vim.g.snippets = "luasnip"

require "xiuxiu.profile"
require "xiuxiu.globals"
require "xiuxiu.disable_builtin"
require "xiuxiu.general"
require "xiuxiu.mappings"
require "xiuxiu.plugins"

require "xiuxiu.lsp"
