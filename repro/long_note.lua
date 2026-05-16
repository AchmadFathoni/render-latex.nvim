local source = debug.getinfo(1, "S").source:sub(2)
local root = vim.fn.fnamemodify(source, ":p:h:h")
package.path = root .. "/?.lua;" .. package.path

local common = require("repro.common")

common.bootstrap_lazy("render-latex-long-note-repro")

require("lazy").setup({
  spec = {
    common.render_latex_spec({
      prefetch_lines = 80,
      max_file_lines = 20000,
      render = {
        preset = "compact",
      },
    }),
  },
})

common.default_keymaps()
