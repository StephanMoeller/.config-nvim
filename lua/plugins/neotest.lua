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


      -- Zig build/test og clean quickfix
      vim.keymap.set("n", "<leader>bt", function()
        -- run zig build, only to get any compile errors. We will also run neotest.run.run(...) which will be the actual runner showing the pretty test run list
        local output = vim.fn.systemlist("zig build test 2>&1")
        local qf_lines = {}

        for _, line in ipairs(output) do
          if (line:match("error:") or line:match("warning:")) and not line:match("failed: expected") and not line:match("while executing test") then
            table.insert(qf_lines, line)
          end
        end

        -- show errors on file list
        vim.fn.setqflist({}, "r", { title = "Zig Build", lines = qf_lines })
        vim.cmd("copen")

        -- Now also run the test runner, which output will be useless in case of compiler errors but useful if no errors.
        neotest.run.run({ suite = true })
        neotest.summary.open()
      end, { desc = "Build & test Zig med pæn quickfix-liste" })




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
