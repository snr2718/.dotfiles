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
vim.keymap.set('n', '<C-h>', '<C-w>h', {noremap=true})
vim.keymap.set('n', '<C-j>', '<C-w>j', {noremap=true})
vim.keymap.set('n', '<C-k>', '<C-w>k', {noremap=true})
vim.keymap.set('n', '<C-l>', '<C-w>l', {noremap=true})

-- source ~/.config/nvim/init.lua
vim.api.nvim_create_user_command('So', 'source ~/.config/nvim/init.lua', {})

--clear highlighting after search
vim.keymap.set('n', '<leader>/', ':noh<CR>', {noremap=true})

-- Move cursor to new window after split
vim.keymap.set('n', "<leader>vs", ":vsplit<CR><C-w>w", {noremap=true})
vim.keymap.set('n', "<leader>hs", ":split<CR><C-w>w", {noremap=true})

--Exploreer
vim.keymap.set('n', '<leader>nt', vim.cmd.Ex)
