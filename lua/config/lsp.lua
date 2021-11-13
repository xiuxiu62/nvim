local M = {}

function M.setup()
    local sumneko_binary = "/usr/bin/lua-language-server"
    local lspconfig = require("lspconfig")
    local setup_auto_format = require('util.lsp').setup_auto_format
    local maps = require('util.maps');

    setup_auto_format("c")
    setup_auto_format("cs")
    setup_auto_format("cpp")
    setup_auto_format("css")
    setup_auto_format("dart")
    setup_auto_format("html")
    setup_auto_format("js")
    setup_auto_format("json")
    setup_auto_format("jsx")
    setup_auto_format("lua", "lua require('stylua-nvim').format_file()")
    setup_auto_format("py")
    setup_auto_format("rs")
    setup_auto_format("ts")
    setup_auto_format("tsx")

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- Web
    require("null-ls").config({})
    require("lspconfig")["null-ls"].setup({})
    lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach = function(client)
            -- disable tsserver formatting if you plan on formatting via null-ls
            client.resolved_capabilities.document_formatting = false

            local ts_utils = require("nvim-lsp-ts-utils")

            -- defaults
            ts_utils.setup({
                debug = false,
                disable_commands = false,
                enable_import_on_completion = false,

                -- import all
                import_all_timeout = 5000, -- ms
                import_all_priorities = {
                    buffers = 4, -- loaded buffer names
                    buffer_content = 3, -- loaded buffer content
                    local_files = 2, -- git files or files with relative path markers
                    same_file = 1, -- add to existing import statement
                    b = {
                        noooooo = 10,
                    },
                },
                import_all_scan_buffers = 100,
                import_all_select_source = false,

                -- eslint
                eslint_enable_code_actions = true,
                eslint_enable_disable_comments = true,
                eslint_bin = "eslint_d",
                eslint_config_fallback = nil,
                eslint_enable_diagnostics = false,
                eslint_show_rule_id = false,

                -- formatting
                enable_formatting = true,
                formatter = "prettier",
                formatter_config_fallback = nil,

                -- update imports on file move
                update_imports_on_move = false,
                require_confirmation_on_move = false,
                watch_dir = nil,
            })

            -- required to fix code action ranges
            ts_utils.setup_client(client)
        end,
    })

    lspconfig.jsonls.setup({
        capabilities = capabilities,
        commands = {
            Format = {
                function()
                    vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
                end,
            },
        },
    })

    lspconfig.html.setup({
        cmd = { "html-languageserver", "--stdio" },
        capabilities = capabilities,
        filetype = { "html" },
        init_options = {
            configurationSection = { "html", "css", "javascript" },
            embeddedLanguages = {
                css = true,
                javascript = true,
            }
        },
        settings = {}
    })
    lspconfig.cssls.setup({
        cmd = { "css-languageserver", "--stdio" },
        capabilities = capabilities
    })
    lspconfig.tailwindcss.setup({})
    lspconfig.svelte.setup({ capabilities = capabilities })

    lspconfig.clangd.setup({})
    lspconfig.pylsp.setup({})

    -- Lua
    local luadev = require("lua-dev").setup({
        lspconfig = {
            cmd = { sumneko_binary },
        }
    })
    require("lspconfig").sumneko_lua.setup(luadev)

    vim.lsp.handlers["textDocument/codeAction"] = require("lsputil.codeAction").code_action_handler

    -- Mappings
    maps.nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", true)
    maps.nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", true)
    maps.nnoremap("gr", "<cmd>LspTrouble lsp_references<CR>", true)
    maps.nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", true)
    maps.nnoremap("<C-space>", "<cmd>lua vim.lsp.buf.hover()<CR>", true)
    maps.vnoremap("<C-space>", "<cmd>RustHoverRange<CR>")

    maps.nnoremap("ge", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", true)
    maps.nnoremap("gE", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", true)
    maps.nnoremap("<silent><leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", true)
    maps.nnoremap("<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", true)
    maps.nnoremap("<Leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", true)
    maps.vnoremap("<Leader>a", "<cmd>lua vim.lsp.buf.range_code_action()<CR>")

    maps.nnoremap("<Leader>ld", "<cmd>LspTrouble lsp_definitions<CR>", true)
    maps.nnoremap("<Leader>le", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", true)
    maps.nnoremap("<Leader>lE", "<cmd>LspTroubleWorkspaceToggle<CR>", true)
end

return M
