local M = {}

function M.setup()
    local cmp =  require "cmp"

    cmp.setup { 
        mapping = {
            ["<C-d>"] = cmp.mapping.scroll_docs(-4),
            ["<C-u>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
            { name = "gh_issues" },
            { name = "nvim_lua" },
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "luasnip" },
            { name = "buffer" },
        },
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        experimental = {
            native_menu = false,
            ghost_text = true,
        },
    }
end

return M
