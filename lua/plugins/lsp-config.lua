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
      vim.keymap.set({ "n", "v" }, "<leader>s", vim.lsp.buf.code_action, {})
      
      vim.keymap.set("n", "<s-Up>", vim.diagnostic.goto_prev, {})
      vim.keymap.set("n", "<s-Down>", vim.diagnostic.goto_next, {})

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
