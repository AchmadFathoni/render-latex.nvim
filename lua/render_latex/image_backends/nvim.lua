local M = {}

function M.set(data_or_id, opts)
  return vim.ui.img.set(data_or_id, opts)
end

function M.get(id)
  return vim.ui.img.get(id)
end

function M.del(id)
  return vim.ui.img.del(id)
end

function M.supported()
  return vim.ui.img ~= nil and type(vim.ui.img.set) == "function"
end

return M
