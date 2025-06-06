return { 
  "catppuccin/nvim", name = "catppuccin", priority = 1000,
  config = function()
    vim.cmd.colorscheme "catppuccin"
  -- ensure background color is controlled by terminal (to let tmux change it depending on focus)
    vim.cmd [[
      highlight Normal       guibg=NONE ctermbg=NONE
      highlight NormalNC     guibg=NONE ctermbg=NONE
      highlight VertSplit    guibg=NONE ctermbg=NONE
      highlight SignColumn   guibg=NONE ctermbg=NONE
      highlight LineNr       guibg=NONE ctermbg=NONE
      highlight EndOfBuffer  guibg=NONE ctermbg=NONE
    ]]
  end

}
