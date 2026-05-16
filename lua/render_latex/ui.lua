local M = {}

function M.has_popup_or_floating_windows()
  if vim.fn.pumvisible() == 1 then
    return true
  end

  for _, winid in ipairs(vim.api.nvim_list_wins()) do
    local cfg = vim.api.nvim_win_get_config(winid)
    if cfg.relative ~= nil and cfg.relative ~= "" then
      return true
    end
  end
  return false
end

return M
