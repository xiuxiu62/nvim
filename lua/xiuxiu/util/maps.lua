local M = {}

M.actions = {}

function M.setup()
  M.actions = {}
end

function M.nnoremap(lhs, rhs, silent)
  vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = silent or false })
end

function M.inoremap(lhs, rhs)
  vim.api.nvim_set_keymap("i", lhs, rhs, { noremap = true })
end

function M.inosilentexprremap(lhs, rhs)
  vim.api.nvim_set_keymap("i", lhs, rhs, { noremap = true, expr = true, silent = true })
end

function M.vnoremap(lhs, rhs)
  vim.api.nvim_set_keymap("v", lhs, rhs, { noremap = true })
end

return M
