-- set leader
vim.g.mapleader = " "

-- Line Numbers
vim.o.number = true
vim.o.relativenumber = true

-- Indentation
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Window traversals
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap=true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap=true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap=true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap=true})

-- source ~/.config/nvim/init.lua
vim.api.nvim_create_user_command('So', 'source ~/.config/nvim/init.lua', {})

--clear highlighting after search
vim.keymap.set('n', '<leader>/', ':noh<CR>', {noremap=true})
