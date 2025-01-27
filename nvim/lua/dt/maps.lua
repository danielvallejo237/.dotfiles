-------------------------------------------------
-- DT'S NEOVIM CONFIGURATION
-- Neovim website: https://neovim.io/
-- DT's dotfiles: https://gitlab.com/dwt1/dotfiles
-------------------------------------------------

-------------------------------------------------
-- KEYBINDINGS
-------------------------------------------------

vim.cmd(
        'nnoremap <C-s> :w<CR>\
        inoremap <C-s> <Esc>:w<CR>\
        nnoremap <C-q> :wq<CR>\
        inoremap <C-q> <Esc>:wq<CR>\
        vmap <C-c> "*y\
        nmap <C-c> "*Y\
        nmap <C-v> "*p'
)
-- set a keymap for windows option with w
vim.cmd(
	'inoremap <C-w> <Esc><C-w>'
)
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('v', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
vim.keymap.set('v', '<C-f>', builtin.live_grep, {})


