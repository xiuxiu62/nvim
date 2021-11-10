local M = {}

local maps = require('util.maps')

function M.setup() 
    -- smart quit
    maps.nnoremap("qq", '<cmd>lua require("util/smartquit")()<CR>', true)

    -- Use alt +hjkl  to resize windows
    maps.nnoremap("<M-j>", ":resize -2<CR>")
    maps.nnoremap("<M-k>", ":resize +2<CR>")
    maps.nnoremap("<M-h>", ":vertical resize -2<CR>")
    maps.nnoremap("<M-l>", ":vertical resize +2<CR>")

    -- Escape redraws the screen and removes any search highlighting.
    maps.nnoremap("<esc>", ":noh<return><esc>")

    -- Easy CAPS
    maps.inoremap("<c-u>", "<ESC>viwUi")

    -- TAB
    maps.nnoremap('te', ':tabedit ')
    maps.nnoremap("<TAB>", ":bnext<CR>")
    maps.nnoremap("<S-TAB>", ":bprevious<CR>")

    -- Better tabbing
    maps.vnoremap("<", "<gv")
    maps.vnoremap(">", ">gv")

    -- Better window splitting 
    maps.nnoremap("ss", ":split<Return><C-w>w")
    maps.nnoremap("sv", ":vsplit<Return><C-w>w")

    -- Better window navigation
    maps.nnoremap("<C-h>", "<C-w>h")
    maps.nnoremap("<C-j>", "<C-w>j")
    maps.nnoremap("<C-k>", "<C-w>k")
    maps.nnoremap("<C-l>", "<C-w>l")

    -- Map Ctrl-Backspace to delete the previous word in insert mode.
    maps.inoremap("<C-w>", "<C-\\><C-o>dB")
    maps.inoremap("<C-BS>", "<C-\\><C-o>db")

    -- Symbols Outline
    -- maps.nnoremap("<Leader>s", ":SymbolsOutline<CR>")

    -- Ranger
    -- maps.nnoremap("<C-s>", ":RnvimrToggle<CR>")

    -- WhichKey
    -- maps.nnoremap("<leader>", ":WhichKey '<Space>'<CR>", true)

    -- Comentary
    maps.nnoremap("<space>/", '<cmd>lua require("util/comment")()<CR>')
    maps.vnoremap("<space>/", '<cmd>lua require("util/comment")()<CR>')

    -- LSP
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

    -- Telescope
    maps.nnoremap("<C-f>", ':lua require("util/telescope").search_files()<CR>')
    maps.nnoremap("/", ':lua require("util/telescope").search_in_buffer()<CR>')
    maps.inoremap("<C-f>", '<Esc> :lua require("util/telescope").search_in_buffer()<CR>')
    maps.nnoremap("<Leader>fg", '<Esc> :lua require("telescope.builtin").live_grep()<CR>')
    maps.nnoremap("<Leader>fd", '<Esc> :lua require("util/telescope").search_dotfiles()<CR>')
end

return M
