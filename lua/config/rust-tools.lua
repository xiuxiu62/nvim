local M = {}

function M.setup()
    require("rust-tools").setup({
        server = {
            on_attach = function()
                vim.cmd([[au BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()]])
            end,
        },
    })
end

return M
