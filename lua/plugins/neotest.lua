return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "lawrence-laz/neotest-zig", -- Installation
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
    config = function()
      local neotest = require("neotest")
      neotest.setup({
        adapters = {
          -- Registration
          require("neotest-zig")({
            dap = {
              adapter = "lldb",
            },
          }),
        }
      })
      local opts = { noremap = true, silent = true }
      -- Run nearest test
      --vim.keymap.set("n", "<leader>tt", function() neotest.run.run() neotest.summary.open() end, opts)
    end
  },
  {
    { "nvim-neotest/nvim-nio" }
  }
}
