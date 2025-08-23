return {
  -- Bufferline plugin
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons", -- for file icons
    config = function()
      -- Setup bufferline
      require("bufferline").setup({
        options = {
          numbers = "none",
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          left_trunc_marker = "<",
          right_trunc_marker = ">",
          max_name_length = 18,
          tab_size = 18,
          diagnostics = "nvim_lsp", -- show LSP diagnostics
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
            },
          },
        },
      })

      -- Keymaps for buffer navigation
      vim.keymap.set("n", "<C-PageDown>", ":bnext<CR>", { silent = true })
      vim.keymap.set("n", "<C-PageUp>", ":bprevious<CR>", { silent = true })

      -- Save and close current buffer with Ctrl+w
      vim.keymap.set("n", "<C-w>", ":w<CR>:bd<CR>", { silent = true })
    end,
  },
}
