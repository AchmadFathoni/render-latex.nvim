local M = {}

local function notebook_module()
  local ok, notebook = pcall(require, "jupynvim.notebook")
  if ok and type(notebook) == "table" then
    return notebook
  end
  return nil
end

function M.notebook(bufnr)
  local notebook = notebook_module()
  if notebook == nil or type(notebook.get) ~= "function" then
    return nil
  end

  local ok, nb = pcall(notebook.get, bufnr)
  if ok then
    return nb
  end
  return nil
end

function M.markdown_ranges(bufnr)
  local notebook = notebook_module()
  local nb = notebook ~= nil and M.notebook(bufnr) or nil
  if notebook == nil or nb == nil or type(nb.cells) ~= "table" then
    return {}
  end

  local sep = notebook.CELL_SEP
  if type(sep) ~= "string" or sep == "" then
    return {}
  end

  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local ranges = {}
  local start_row = 0
  local cell_index = 1

  for index, line in ipairs(lines) do
    if line == sep then
      local cell = nb.cells[cell_index]
      if cell ~= nil and cell.cell_type == "markdown" and start_row <= index - 2 then
        ranges[#ranges + 1] = { start_row = start_row, end_row = index - 2 }
      end
      start_row = index
      cell_index = cell_index + 1
    end
  end

  local cell = nb.cells[cell_index]
  if cell ~= nil and cell.cell_type == "markdown" and start_row <= #lines - 1 then
    ranges[#ranges + 1] = { start_row = start_row, end_row = #lines - 1 }
  end

  return ranges
end

function M.status(bufnr)
  local loaded = package.loaded["jupynvim"] ~= nil or package.loaded["jupynvim.notebook"] ~= nil
  local nb = M.notebook(bufnr)
  local ranges = nb ~= nil and M.markdown_ranges(bufnr) or {}
  return {
    loaded = loaded,
    notebook = nb ~= nil,
    markdown_ranges = #ranges,
    experimental = true,
  }
end

return M
