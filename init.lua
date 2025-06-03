-- Ensure lazy is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Define the plugins for lazy to install on startup



-- Tell lazy to install these plugins
require("vim-options")
require("lazy").setup("plugins")
require("mappings")



local ns_id = vim.api.nvim_create_namespace("rel_line_number_eol")

local function add_end_of_line_rel_numbers(bufnr)
  vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local cursor_line = vim.api.nvim_win_get_cursor(0)[1]

  for i, line in ipairs(lines) do
    local rel_num = math.abs(cursor_line - i)
    if rel_num == 0 then
      rel_num = "" -- Keep current line clean (or set to "0" if you want)
    end

    local trimmed = line:match("^(.-)%s*$")
    local virt_col = #trimmed

    vim.api.nvim_buf_set_extmark(bufnr, ns_id, i - 1, virt_col, {
      virt_text = { { " " .. rel_num, "LineNr" } },
      virt_text_pos = "eol",
    })
  end
end

-- Redraw when the cursor moves or buffer changes
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "BufEnter", "TextChanged", "TextChangedI", "InsertLeave" }, {
  callback = function(args)
    add_end_of_line_rel_numbers(args.buf)
  end,
})

