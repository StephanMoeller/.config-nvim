
 return { 
   'nvim-treesitter/nvim-treesitter',
   build = ':TSUpdate',
   config = function()
    -- Configure treesitter
    local treesitter_config = require("nvim-treesitter.configs")
    treesitter_config.setup({
      ensure_installed = {"lua", "javascript"},
      highlight = { enable = true },
      indent = { enable = true }
    })
   end

 }
