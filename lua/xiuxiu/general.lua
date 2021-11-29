local opt = vim.opt

opt.syntax = "enable"
opt.wrap = false
opt.hidden = true
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.ruler = true
opt.cmdheight = 2
opt.iskeyword:append "-"
opt.mouse = "a"
opt.splitbelow = true
opt.splitright = true
opt.conceallevel = 0
opt.tabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.relativenumber = true
opt.showmatch = true
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.number = true
opt.cursorline = true
opt.background = "dark"
opt.showtabline = 4
opt.updatetime = 300
opt.timeoutlen = 500
opt.formatoptions:remove "cro"
opt.clipboard = "unnamedplus"
opt.autochdir = true
opt.termguicolors = true
opt.textwidth = 120
opt.colorcolumn = "120"
opt.completeopt = "menuone,noinsert,noselect"
opt.shortmess:append "c"
