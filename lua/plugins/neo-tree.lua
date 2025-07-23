return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opst = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        visible = true,
        never_show = {},
      }
    }

  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            -- add extension names you want to explicitly exclude
            -- '.git',
            -- '.DS_Store',
            -- 'thumbs.db',
          },
          never_show = { ".git" },
        },
      },
    })
    -- Configure neo-tree
    vim.keymap.set('n', '<M-e>', ':Neotree filesystem reveal left<CR>')
  end
}
