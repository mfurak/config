-- Define a mapping for jk to switch to normal mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })

-- Reset timeout for 'jk' mapping
vim.o.timeoutlen = 1000

-- Set the mapleader to '
vim.g.mapleader = "'"

-- Enable syntax highlighting
vim.cmd('syntax enable')

-- Show line numbers
vim.cmd('set number')

-- Disable the swapfile
vim.cmd('set noswapfile')

-- Enable search result highlighting
vim.cmd('set hlsearch')

-- Ignore case in search
vim.cmd('set ignorecase')

-- Show search results as you type
vim.cmd('set incsearch')
