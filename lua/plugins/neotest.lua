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
      -- Run file
      vim.keymap.set("n", "<leader>tt", function()
        neotest.run.run(vim.fn.expand("%"))
        neotest.summary.open()
      end, opts)
      -- Run all
      vim.keymap.set("n", "<leader>ta", function()
        neotest.run.run({ suite = true })
        neotest.summary.open()
      end, opts)
      vim.keymap.set("n", "<leader>td", function() neotest.run.run({ strategy = "dap" }) end, opts) -- Debug test
      vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end, opts)              -- Toggle summary
      vim.keymap.set("n", "<leader>to", function() neotest.output.open({ enter = true }) end, opts) -- Open output
      vim.keymap.set("n", "<leader>tO", function() neotest.output_panel.toggle() end, opts)         -- Toggle output panel
    end
  },
  {
    { "nvim-neotest/nvim-nio" }
  }
}
