local has_lsp, lspconfig = pcall(require, "lspconfig")
if not has_lsp then
  return
end

local lspconfig_util = require "lspconfig.util"
local nvim_status = require "lsp-status"

local inoremap = require("xiuxiu.util.maps").inoremap
local nnoremap = require("xiuxiu.util.maps").nnoremap
local handlers = require "xiuxiu.lsp.handlers"
local status = require "xiuxiu.lsp.status"
local telescope_mapper = require "xiuxiu.telescope.mappings"
local setup_auto_format = require("xiuxiu.util.lsp").setup_auto_format

-- Auto format
setup_auto_format "c"
setup_auto_format "cs"
setup_auto_format "cpp"
setup_auto_format "css"
setup_auto_format "dart"
setup_auto_format "html"
setup_auto_format "js"
setup_auto_format "json"
setup_auto_format "jsx"
-- setup_auto_format("lua", "lua require 'stylua-nvim'.format_file()")
setup_auto_format "py"
setup_auto_format "rs"
setup_auto_format "ts"
setup_auto_format "tsx"

status.activate()

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local filetype_attach = setmetatable({
  go = function(client)
    vim.cmd [[
      augroup lsp_buf_format
        au! BufWritePre <buffer>
        autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()
      augroup END
    ]]
  end,

  rust = function()
    telescope_mapper("<space>wf", "lsp_workspace_symbols", {
      ignore_filename = true,
      query = "#",
    }, true)

    vim.cmd [[
      augroup lsp_buf_format
        au! BufWritePre <buffer>
        autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()
      augroup END
    ]]
  end,
}, {
  __index = function()
    return function() end
  end,
})

local custom_attach = function(client)
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  nvim_status.on_attach(client)

  inoremap("<c-s>", "<cmd> lua vim.lsp.buf.signature_help()<CR>")

  nnoremap("gd", "<cmd> lua vim.lsp.buf.definition()<CR>")
  nnoremap("gD", "<cmd> lua vvim.lsp.buf.declaration()<CR>")
  nnoremap("gT", "<cmd> lua vvim.lsp.buf.type_definition()<CR>")
  nnoremap("<space>cr", "<cmd> lua vvim.lsp.buf.rename()<CR>")
  nnoremap("<space>gI", "<cmd> lua vhandlers.implementation()<CR>")
  nnoremap("<space>wd", "<cmd>lua R('xiuxiu.lsp.codelens').run()<CR>")
  nnoremap("<space>ww", "LspRestart")

  telescope_mapper("gr", "lsp_references", nil, true)
  telescope_mapper("gI", "lsp_implementations", nil, true)
  telescope_mapper("<space>ca", "lsp_code_actions", nil, true)
  telescope_mapper("<space>wd", "lsp_document_symbols", { ignore_filename = true }, true)
  telescope_mapper("<space>ww", "lsp_code_actions", { ignore_filename = true }, true)

  if filetype ~= "lua" then
    nnoremap("K", "<cmd>vim.lsp.buf.hover()<CR>")
  end

  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end

  if client.resolved_capabilities.code_lens then
    vim.cmd [[
      augroup lsp_document_codelens
        au! * <buffer>
        autocmd BufEnter ++once         <buffer> lua require"vim.lsp.codelens".refresh()
        autocmd BufWritePost,CursorHold <buffer> lua require"vim.lsp.codelens".refresh()
      augroup END
    ]]
  end

  -- Attach any filetype specific options to the client
  filetype_attach[filetype](client)
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities = vim.tbl_deep_extend("keep", updated_capabilities, nvim_status.capabilities)
updated_capabilities.textDocument.codeLens = { dynamicRegistration = false }
updated_capabilities = require("cmp_nvim_lsp").update_capabilities(updated_capabilities)

-- TODO: check if this is the problem.
updated_capabilities.textDocument.completion.completionItem.insertReplaceSupport = false

local sumneko_root_path = "/usr"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local servers = {
  cssls = true,
  graphql = true,
  jsonls = true,
  pyright = true,
  rust_analyzer = true,
  svelte = true,
  tailwindcss = true,
  vimls = true,
  yamlls = true,

  cmake = (1 == vim.fn.executable "cmake-language-server"),

  clangd = {
    cmd = {
      "clangd",
      "--background-index",
      "--suggest-missing-includes",
      "--clang-tidy",
      "--header-insertion=iwyu",
    },
    -- Required for lsp-status
    init_options = {
      clangdFileStatus = true,
    },
    handlers = nvim_status.extensions.clangd.setup(),
  },

  gopls = {
    root_dir = function(fname)
      local Path = require "plenary.path"

      local absolute_cwd = Path:new(vim.loop.cwd()):absolute()
      local absolute_fname = Path:new(fname):absolute()

      if string.find(absolute_cwd, "/cmd/", 1, true) and string.find(absolute_fname, absolute_cwd, 1, true) then
        return absolute_cwd
      end

      return lspconfig_util.root_pattern("go.mod", ".git")(fname)
    end,

    settings = {
      gopls = {
        codelenses = { test = true },
      },
    },

    flags = {
      debounce_text_changes = 200,
    },
  },

  html = {
    cmd = { "html-languageserver", "--stdio" },
    filetypes = {
      "html",
    },
  },

  tsserver = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
  },
}

local setup_server = function(server, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    flags = {
      debounce_text_changes = 50,
    },
  }, config)

  lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
  setup_server(server, config)
end

return {
  on_init = custom_init,
  on_attach = custom_attach,
  capabilities = updated_capabilities,
}

-- Load lua configuration from nlua.
-- require("nlua.lsp.nvim").setup(lspconfig, {
--   on_init = custom_init,
--   on_attach = custom_attach,
--   capabilities = updated_capabilities,

--   root_dir = function(fname)
--     if string.find(vim.fn.fnamemodify(fname, ":p"), "xdg_config/nvim/") then
--       return vim.fn.expand "~/git/config_manager/xdg_config/nvim/"
--     end

--     -- ~/git/config_manager/xdg_config/nvim/...
--     return lspconfig_util.find_git_ancestor(fname) or lspconfig_util.path.dirname(fname)
--   end,

--   globals = {
--     -- Colorbuddy
--     "Color",
--     "c",
--     "Group",
--     "g",
--     "s",

--     -- Custom
--     "RELOAD",
--   },
-- })
