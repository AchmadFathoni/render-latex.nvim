local source = debug.getinfo(1, "S").source:sub(2)
local root = vim.fn.fnamemodify(source, ":p:h:h")
package.path = root .. "/?.lua;" .. package.path

local common = require("repro.common")

common.bootstrap_lazy("render-latex-jupynvim-repro")

require("lazy").setup({
  spec = {
    {
      "sheng-tse/jupynvim",
      build = function(plugin)
        local install = loadfile(plugin.dir .. "/lua/jupynvim/install.lua")()
        install.run(plugin)
      end,
      config = function()
        local jupynvim = require("jupynvim")
        jupynvim.setup({
          log_level = "info",
          image_renderer = "placeholder",
        })
      end,
    },
    common.render_latex_spec({
      render = {
        inline = false,
      },
    }),
  },
})

common.default_keymaps()
