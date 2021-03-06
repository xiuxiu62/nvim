local M = {}

__XIUXIU_OriginalHandlers = __XIUXIU_OriginalHandlers or {}
M._original_functions = __XIUXIU_OriginalHandlers

function M.set(method, new_function)
  if M._original_functions[method] == nil then
    M._original_functions[method] = vim.lsp.handlers[method]
  end

  vim.lsp.handlers[method] = new_function
end

function M.get(method)
  if M._original_functions[method] == nil then
    M._original_functions[method] = vim.lsp.handlers[method]
  end

  return M._original_functions[method]
end

return M
