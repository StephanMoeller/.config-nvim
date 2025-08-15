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
vim.keymap.set({ 'n', 'v', 'i' }, '<f8>', ':cn<enter>')
vim.keymap.set({ 'n', 'v', 'i' }, '<f9>', ':cp<enter>')
