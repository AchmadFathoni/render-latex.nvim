local source = debug.getinfo(1, "S").source:sub(2)
local root = vim.fn.fnamemodify(source, ":p:h:h")
package.path = root .. "/?.lua;" .. package.path

local common = require("repro.common")

common.bootstrap_lazy("render-latex-light-theme-repro")

vim.opt.background = "light"

require("lazy").setup({
  spec = {
    {
      "maxmx03/solarized.nvim",
      lazy = false,
      priority = 1000,
      opts = {
        styles = {
          comments = {},
          functions = {},
          variables = {},
        },
      },
      config = function(_, opts)
        require("solarized").setup(opts)
        vim.cmd.colorscheme("solarized")
        vim.opt.background = "light"
      end,
    },
    common.render_latex_spec({
      render = {
        preset = "match_text",
        match_text_color = true,
        background = "transparent",
      },
    }),
  },
})

common.default_keymaps()

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.notify(
      "Solarized Light repro loaded. Check equation foreground contrast against light backgrounds.",
      vim.log.levels.INFO,
      { title = "render-latex light theme repro" }
    )
  end,
})
