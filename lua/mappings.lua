vim.wo.relativenumber = true
vim.wo.number = true

-- PROGRAMMING: Add comma and semicolon to the end of the current line
vim.keymap.set('n', 'K', 'mzJ`z', { desc = 'Join lines' })
vim.keymap.set('n', 'k', 'f,wi<enter><esc>', { desc = 'Split lines' })
vim.keymap.set('n', 'U', '<c-r>', { desc = 'Redo' })
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Copy to clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Paste from clipboard' })
vim.keymap.set({ 'n', 'v' }, '<c-p>', '"0p', { desc = 'Paste last yanked' })
vim.keymap.set('n', '*', '*zz', { desc = 'Center when *' })
vim.keymap.set('n', 'n', 'nzz', { desc = 'Center when n' })

-- Home and end go to first and last non space character
vim.keymap.set({ 'n', 'v' }, '<Home>', '<Home>_', { desc = 'Home => first non space' })
vim.keymap.set('i', '<Home>', '<esc><home>_i', { desc = 'Home => first non space' })
vim.keymap.set('n', '<End>', 'g_', { desc = 'End => last non space' })
vim.keymap.set('i', '<End>', '<esc>g_a', { desc = 'End => last non space' })
vim.keymap.set('n', '<c-a>', 'gg<home>vG<end>', { desc = 'Select all' })
vim.keymap.set('v', '<End>', 'g_', { desc = 'End => last non space' })
vim.keymap.set('n', '<c-z>', 'zz', { desc = 'Select all' })
vim.keymap.set({ 'n', 'v' }, '<c-Up>', '10<Up>zz', { desc = 'Navigate with crlt arrows instead of c-d and c-u' })
vim.keymap.set({ 'n', 'v' }, '<c-Down>', '10<Down>', { desc = 'Navigate with crlt arrows instead of c-d and c-u' })

vim.keymap.set('n', 'h', 'v', { desc = 'Use h instead of v for ergo reasons' })
vim.keymap.set('n', 'H', 'V', { desc = 'Use h instead of v for ergo reasons' })

vim.keymap.set({ 'n', 'v' }, '<C-S>', ':wa<Enter>', { desc = 'save all files' })
vim.keymap.set('i', '<C-S>', '<Esc>:wa<Enter>', { desc = 'save all files' })

vim.keymap.set('n', '<C-Q>', ':q!<Enter>', { desc = 'save all files' })

vim.keymap.set('n', '<c-i>', '<c-o>', { desc = 'swap c-i and c-o' })
vim.keymap.set('n', '<c-o>', '<c-i>', { desc = 'swap c-i and c-o' })

vim.keymap.set({ 'n', 'v', 'i' }, '<m-left>', '<Esc>:TmuxNavigateLeft<CR>')
vim.keymap.set({ 'n', 'v', 'i' }, '<m-right>', '<Esc>:TmuxNavigateRight<cr>')
vim.keymap.set({ 'n', 'v', 'i' }, '<m-up>', '<Esc>:TmuxNavigateUp<cr>')
vim.keymap.set({ 'n', 'v', 'i' }, '<m-down>', '<Esc>:TmuxNavigateDown<cr>')

vim.keymap.set('n', ';', 'A;<ESC><HOME><DOWN>')
vim.keymap.set('n', ',', 'A,<ESC><HOME><DOWN>')
vim.keymap.set('n', '<m-c-b>', ':echo "building..." | !zig build run<enter>')
vim.keymap.set('n', '<leader>tt', 'itry<space><esc>')
vim.keymap.set('n', '<leader>ss', 'iself.<esc>')
vim.keymap.set('n', '<esc>', ':nohl<enter>')
vim.keymap.set('n', '<leader>so', ':so ~/.config/nvim/lua/mappings.lua<enter>')
vim.keymap.set({ 'n', 'v', 'i' }, '<c-z>', 'zz')


-- Function to get the largest window in the current tab
local function get_largest_window()
  local largest_win = vim.api.nvim_get_current_win()
  local max_area = 0

  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local width = vim.api.nvim_win_get_width(win)
    local height = vim.api.nvim_win_get_height(win)
    local area = width * height

    if area > max_area then
      largest_win = win
      max_area = area
    end
  end

  return largest_win
end

-- next
local function cn_in_biggest_window()
  local largest_win = get_largest_window()
  vim.api.nvim_set_current_win(largest_win)
  vim.cmd('silent cn');
end
local function cp_in_biggest_window()
  local largest_win = get_largest_window()
  vim.api.nvim_set_current_win(largest_win)
  vim.cmd('silent cp');
end

local shown = false;
local function toggle_quick_list()
  if shown then
    vim.cmd('botright cclose')
    shown = false;
  else
    vim.cmd('botright copen')
    shown = true;
  end
end

vim.keymap.set({ 'n', 'v', 'i' }, '<f8>', cn_in_biggest_window)
vim.keymap.set({ 'n', 'v', 'i' }, '<f9>', cp_in_biggest_window)
vim.keymap.set({ 'n', 'v', 'i' }, '<m-b>', toggle_quick_list)

-- Helper to check if a buffer is a Neo-tree buffer
local function is_neotree(bufnr)
  local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
  return ft == "neo-tree"
end

-- Run code when focus enters Neo-tree
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function(args)
    if is_neotree(args.buf) then
      print("Entered Neo-tree!")
      -- Place your code here
    end
  end,
})

-- Run code when focus leaves Neo-tree
vim.api.nvim_create_autocmd("BufLeave", {
  callback = function(args)
    if is_neotree(args.buf) then
      print("Left Neo-tree!")
      -- Place your code here
    end
  end,
})
