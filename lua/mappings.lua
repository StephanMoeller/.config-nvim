
vim.wo.relativenumber = true
vim.wo.number = true

-- PROGRAMMING: Add comma and semicolon to the end of the current line
vim.keymap.set('n', 'K', 'mzJ`z', { desc = 'Join lines' })
vim.keymap.set('n', 'k', 'f,wi<enter><esc>', { desc = 'Split lines' })
vim.keymap.set('n', 'U', '<c-r>', { desc = 'Redo' })
vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Copy to clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Copy to clipboard' })
vim.keymap.set('n', '<leader>p', '"+p', { desc = 'Paste from clipboard' })
vim.keymap.set('v', '<leader>p', '"+p', { desc = 'Paste from clipboard' })
vim.keymap.set('n', '<c-p>', '"0p', { desc = 'Paste last yanked' })
vim.keymap.set('v', '<c-p>', '"0p', { desc = 'Paste last yanked' })
vim.keymap.set('n', '*', '*zz', { desc = 'Center when *' })
vim.keymap.set('n', 'n', 'nzz', { desc = 'Center when n' })

-- Home and end go to first and last non space character 
vim.keymap.set('n', '<Home>', '<Home>_', { desc = 'Home => first non space' })
vim.keymap.set('v', '<Home>', '<Home>_', { desc = 'Home => first non space' })
vim.keymap.set('i', '<Home>', '<esc><home>_i', { desc = 'Home => first non space' })
vim.keymap.set('n', '<End>', 'g_', { desc = 'End => last non space' })
vim.keymap.set('i', '<End>', '<esc>g_a', { desc = 'End => last non space' })
vim.keymap.set('n', '<c-a>', 'ggvG', { desc = 'Select all' })
vim.keymap.set('v', '<End>', 'g_', { desc = 'End => last non space' })
vim.keymap.set('n', '<c-z>', 'zz', { desc = 'Select all' })
vim.keymap.set('n', '<c-Up>', '10<Up>zz', { desc = 'Navigate with crlt arrows instead of c-d and c-u' })
vim.keymap.set('v', '<c-Up>', '10<Up>zz', { desc = 'Navigate with crlt arrows instead of c-d and c-u' })
vim.keymap.set('n', '<c-Down>', '10<Down>', { desc = 'Navigate with crlt arrows instead of c-d and c-u' })
vim.keymap.set('v', '<c-Down>', '10<Down>zz', { desc = 'Navigate with crlt arrows instead of c-d and c-u' })

vim.keymap.set('n', 'h', 'v', { desc = 'Use h instead of v for ergo reasons' })
vim.keymap.set('n', 'H', 'V', { desc = 'Use h instead of v for ergo reasons' })

vim.keymap.set('n', '<C-S>', ':wa<Enter>', { desc = 'save all files' })
vim.keymap.set('v', '<C-S>', ':wa<Enter>', { desc = 'save all files' })
vim.keymap.set('i', '<C-S>', '<Esc>:wa<Enter>', { desc = 'save all files' })

vim.keymap.set('n', '<C-W>', ':q!<Enter>', { desc = 'save all files' })
vim.keymap.set('n', '<C-Q>', ':q!<Enter>', { desc = 'save all files' })

vim.keymap.set('n', '<leader>i', vim.lsp.buf.hover, {}) 
vim.keymap.set("n", "<c-n>", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<c-e>", vim.lsp.buf.implementation, {})
vim.keymap.set("n", "<m-c-e>", vim.lsp.buf.references, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})


vim.keymap.set('n', '<c-i>', '<c-o>', { desc = 'swap c-i and c-o' })
vim.keymap.set('n', '<c-o>', '<c-i>', { desc = 'swap c-i and c-o' })


    vim.keymap.set('n', '<m-left>', ':TmuxNavigateLeft<CR>')
    vim.keymap.set('n', '<m-right>', ':TmuxNavigateRight<cr>')
    vim.keymap.set('n', '<m-up>', ':TmuxNavigateUp<cr>')
    vim.keymap.set('n', '<m-down>', ':TmuxNavigateDown<cr>')

    vim.keymap.set('i', '<m-left>', ':TmuxNavigateLeft<cr>')
    vim.keymap.set('i', '<m-right>', ':TmuxNavigateRight<cr>')
    vim.keymap.set('i', '<m-up>', ':TmuxNavigateUp<cr>')
    vim.keymap.set('i', '<m-down>', ':TmuxNavigateDown<cr>')

    vim.keymap.set('v', '<m-left>', ':TmuxNavigateLeft<cr>')
    vim.keymap.set('v', '<m-right>', ':TmuxNavigateRight<cr>')
    vim.keymap.set('v', '<m-up>', ':TmuxNavigateUp<cr>')
    vim.keymap.set('v', '<m-down>', ':TmuxNavigateDown<cr>')
    vim.keymap.set('n', ';', 'A;<ESC><HOME><DOWN>')
    vim.keymap.set('n', ',', 'A,<ESC><HOME><DOWN>')

