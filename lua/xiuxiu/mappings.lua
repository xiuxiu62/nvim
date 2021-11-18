local maps = require "xiuxiu.util.maps"

-- smart quit
maps.nnoremap("qq", '<cmd>lua require("xiuxiu.util.smartquit")()<CR>')

-- Use alt +hjkl  to resize windows
maps.nnoremap("<M-j>", ":resize -2<CR>")
maps.nnoremap("<M-k>", ":resize +2<CR>")
maps.nnoremap("<M-h>", ":vertical resize -2<CR>")
maps.nnoremap("<M-l>", ":vertical resize +2<CR>")

-- Escape redraws the screen and removes any search highlighting.
maps.nnoremap("<esc>", ":noh<return><esc>")

-- Easy CAPS
maps.inoremap("<c-u>", "<ESC>viwUi")

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

-- WhichKey
maps.nnoremap("<Leader>", ":WhichKey '<Space>'<CR>")

-- Comentary
maps.nnoremap("<Leader>;", '<cmd>lua require("xiuxiu.util.comment")()<CR>')
maps.vnoremap("<Leader>;", '<cmd>lua require("xiuxiu.util.comment")()<CR>')
