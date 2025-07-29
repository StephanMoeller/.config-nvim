return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- Save the main_win at startup time
      local main_win = nil
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          main_win = vim.api.nvim_get_current_win()
        end
      })

      -- Opret en funktion der hopper til main window og åbner Telescope
      local function open_files_in_main()
        if main_win and vim.api.nvim_win_is_valid(main_win) then
          vim.api.nvim_set_current_win(main_win)
        end
        require('telescope.builtin').find_files()
      end
      local function live_grep_in_main()
        if main_win and vim.api.nvim_win_is_valid(main_win) then
          vim.api.nvim_set_current_win(main_win)
        end
        require('telescope.builtin').live_grep()
      end
      -- Configure telescope
      --local telescope_config = require("telescope.builtin")
      --vim.keymap.set('n', '<leader>fn', telescope_config.find_files, {})

      vim.keymap.set('n', '<leader>fn', open_files_in_main, {})
      vim.keymap.set('n', '<leader>fg', live_grep_in_main, {}) -- requires ripgrep to be install on order to work
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      -- this is your opts table
      require("telescope").setup {
        extensions = { ["ui-select"] = { require("telescope.themes").get_dropdown {} } }
      }
      require("telescope").load_extension("ui-select")
    end
  }
}
