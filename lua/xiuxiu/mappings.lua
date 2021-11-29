local inoremap = require("xiuxiu.util.maps").inoremap
local nnoremap = require("xiuxiu.util.maps").nnoremap
local vnoremap = require("xiuxiu.util.maps").vnoremap

-- smart quit
nnoremap("qq", '<cmd>lua require("xiuxiu.util.smartquit")()<CR>')

-- Use alt +hjkl  to resize windows
nnoremap("<M-j>", ":resize -2<CR>")
nnoremap("<M-k>", ":resize +2<CR>")
nnoremap("<M-h>", ":vertical resize -2<CR>")
nnoremap("<M-l>", ":vertical resize +2<CR>")

-- Escape redraws the screen and removes any search highlighting.
nnoremap("<esc>", ":noh<return><esc>")

-- Easy CAPS
inoremap("<c-u>", "<ESC>viwUi")

-- Better tabbing
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- Better window splitting
nnoremap("ss", ":split<Return><C-w>w")
nnoremap("sv", ":vsplit<Return><C-w>w")

-- Better window navigation
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- Map Ctrl-Backspace to delete the previous word in insert mode.
inoremap("<C-w>", "<C-\\><C-o>dB")
inoremap("<C-BS>", "<C-\\><C-o>db")

-- Symbols Outline
-- maps.nnoremap("<Leader>s", ":SymbolsOutline<CR>")

-- WhichKey
nnoremap("<Leader>", ":WhichKey '<Space>'<CR>")

-- Comentary
nnoremap("<Leader>;", "<cmd>lua require('xiuxiu.util.comment')()<CR>")
vnoremap("<Leader>;", "<cmd>lua require('xiuxiu.util.comment')()<CR>")

-- -- Rest
-- nnoremap("<Leader>rf", "<Plug>RestNvim<CR>")
-- nnoremap("<Leader>rp", "<Plug>RestNvimPreview<CR>")
-- nnoremap("<Leader>rl", "<Plug>RestNvimLast<CR>")
