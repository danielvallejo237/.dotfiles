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
vim.g.coc_global_extensions = {
        "coc-python",
        "coc-vimtex",
        "coc-markdownlint",
        "coc-json"
}
vim.cmd(
        'nmap <silent> gg <Plug>(coc-definition)'
)
local opts = {
        silent = true,
        noremap = true,
        expr = true,
        replace_keycodes = false
}
vim.g.coc_snippet_next = '<tab>'
vim.keymap.set(
        "i",
        "<C-l>",
        [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
        opts
)
vim.keymap.set(
        "i",
        "<C-Space", -- we do not need the zoom in key 
        [[coc#refresh()]],
        opts
)
-- Nerd Comment
vim.cmd(
        "nmap ++ <plug>NERDCommenterToggle\
        vmap ++ <plug>NERDCommenterToggle"
)

