return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "zls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.zls.setup({})



      vim.keymap.set('n', '<leader>i', vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<c-e>", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<m-c-e>", vim.lsp.buf.references, {})
      vim.keymap.set({ "n", "v" }, "<c-space>", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})

      vim.keymap.set("n", "<s-Up>", vim.diagnostic.goto_prev, {})
      vim.keymap.set("n", "<s-Down>", vim.diagnostic.goto_next, {})


      -- show errors when done writing (in opposition to update_in_instert which will trigger on every keystroke)
      vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
        callback = function()
          vim.diagnostic.show(nil, 0)
        end,
      })

      -- Auto format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })

      -- Ensure inline errors
      vim.diagnostic.config({
        virtual_text = true, -- inline errors
        signs = true,
        underline = true,
        update_in_insert = false, -- run while typing (annoying to look at)
        severity_sort = true,
      })
    end
  },
}
