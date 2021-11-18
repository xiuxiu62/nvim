pcall(require, "impatient")

require "xiuxiu.profile"

if require "xiuxiu.first_load"() then
  return
end

vim.g.mapleader = " "
vim.g.snippets = "luasnip"

require "xiuxiu.globals"
require "xiuxiu.disable_builtin"
require "xiuxiu.general"
require "xiuxiu.mappings"
require "xiuxiu.plugins"
require "xiuxiu.lsp"
