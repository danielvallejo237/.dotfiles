vim.o.foldcolumn="1"
vim.o.foldlevel=99
vim.o.foldlevelstart=99
vim.o.foldenable=true

vim.keymap.set('n','zR',require('ufo').openAllFolds,{desc="Open all folds"})
vim.keymap.set('n','zM',require('ufo').closeAllFolds,{desc="Close all folds"})
vim.keymap.set('n','zK',function() local windi=require('ufo').peekFoldedLinesUnderCursor()
    if not windi then
        vim.lsp.buf.hover()
    end
    end,{desc="Peek folded lines under cursor"})
require('ufo').setup({
 prover_selector=function(bufnr,filetype,buftype) return {'lsp','ident'} end}
)

