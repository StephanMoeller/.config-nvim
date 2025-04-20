return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- Configure telescope
      local telescope_config = require("telescope.builtin")
      vim.keymap.set('n', '<leader>fn', telescope_config.find_files, {})
      vim.keymap.set('n', '<leader>fg', telescope_config.live_grep, {}) -- requires ripgrep to be install on order to work
    end 
  }
