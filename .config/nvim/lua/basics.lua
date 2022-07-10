vim.g.mapleader = " "
vim.o.number  =true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.expandtab = true
vim.o.incsearch = true
vim.o.tabstop = 4
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.hlsearch = false
vim.o.swapfile = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.scrolloff = 4
vim.o.errorbells = false
vim.o.shiftwidth = 4
vim.o.numberwidth = 4
vim.o.termguicolors = true
vim.o.colorcolumn = '100'
vim.o.showmode = false
vim.o.showtabline = 4
vim.o.signcolumn = 'yes'
vim.o.mouse = 'a'
vim.o.background=dark

vim.api.nvim_set_keymap('n', 'vs', ':vs<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'sp', ':sp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'vx', ':close<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w><C-l>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w><C-h>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w><C-k>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w><C-j>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tn', ':tabnew<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tl', ':tabnext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'th', ':tabprev<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'to', ':tabo<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'tc', ':tabclose<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-s>', ':%s/', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-n>', ":NvimTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '<C-,>', ":NvimTreeFocus<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>t", ":sp<CR> :term<CR> :resize 20N<CR> i", {noremap = true, silent = true})
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true, silent = true})

vim.g["netrw_banner"] = 0
vim.g["netrw_liststyle"] = 3
vim.g["netrw_winsize"] = 25
