local M = {}

local required_features = {
  {
    name = "vim.system",
    ok = function()
      return type(vim.system) == "function"
    end,
  },
  {
    name = "vim.uv",
    ok = function()
      return vim.uv ~= nil
    end,
  },
  {
    name = "vim.fs",
    ok = function()
      return vim.fs ~= nil and type(vim.fs.joinpath) == "function"
    end,
  },
  {
    name = "vim.treesitter",
    ok = function()
      return vim.treesitter ~= nil
    end,
  },
  {
    name = "vim.api.nvim_buf_set_extmark",
    ok = function()
      return type(vim.api.nvim_buf_set_extmark) == "function"
    end,
  },
}

function M.missing_required()
  local missing = {}
  for _, feature in ipairs(required_features) do
    local ok = false
    local success, result = pcall(feature.ok)
    if success then
      ok = result == true
    end
    if not ok then
      missing[#missing + 1] = feature.name
    end
  end
  return missing
end

function M.is_supported()
  return #M.missing_required() == 0
end

function M.summary()
  local missing = M.missing_required()
  return {
    supported = #missing == 0,
    missing = missing,
    nvim_version = vim.version and vim.version() or nil,
  }
end

return M
