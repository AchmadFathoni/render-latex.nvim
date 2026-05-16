local Config = require("render_latex.config")

local M = {}

local function is_tmux()
  return vim.env.TMUX ~= nil and vim.env.TMUX ~= ""
end

local function use_builtin()
  return vim.ui.img ~= nil and type(vim.ui.img.set) == "function"
end

local function kitty_supported()
  if is_tmux() then
    return vim.fn.executable("tmux") == 1
  end
  return vim.env.KITTY_WINDOW_ID ~= nil
    or vim.env.WEZTERM_EXECUTABLE ~= nil
    or (vim.env.TERM or ""):lower():find("kitty", 1, true) ~= nil
end

function M.detect_name()
  if Config.image.backend == "nvim" then
    return "nvim"
  end
  if Config.image.backend == "kitty" then
    return "kitty"
  end
  if is_tmux() then
    return "kitty"
  end
  if use_builtin() then
    return "nvim"
  end
  return "kitty"
end

function M.get()
  local name = M.detect_name()
  if name == "nvim" and use_builtin() then
    return require("render_latex.image_backends.nvim"), name
  end
  if name == "nvim" then
    return nil, name, "vim.ui.img is unavailable"
  end
  if kitty_supported() then
    return require("render_latex.image_backends.kitty"), "kitty"
  end
  return nil, name, "kitty image protocol is not available in this terminal"
end

function M.status()
  local backend, name, reason = M.get()
  return {
    name = name,
    available = backend ~= nil,
    reason = reason,
    tmux = is_tmux(),
    builtin_available = use_builtin(),
    kitty_available = kitty_supported(),
  }
end

return M
