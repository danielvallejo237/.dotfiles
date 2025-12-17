-- In your init.lua file
local opts = { noremap = true, silent = true }

-- Configuration of the compiler language
-- Setup mason.nvim
require('mason').setup()
-- Setup mason-lspconfig
require('mason-lspconfig').setup({
    ensure_installed = { "pyright", "clangd", "lua_ls", "html", "cssls", "jsonls", "bashls" }, -- List of servers to ensure are installed
})

vim.lsp.config(
        'clangd',
        {
            cmd={'clangd'},
        })
vim.lsp.enable('clangd') -- Con actualización de nvim +0.11
-- Trigger completion with <C-Space>
vim.cmd('highlight Comment cterm=bold')  -- Italicize comments
vim.cmd('syntax on')  -- Enable syntax highlighting
-- vim autoformat --
vim.cmd(
        "au BufWrite *.py :Autoformat"
    )
vim.cmd("set tabstop=4 softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set encoding=UTF-8")
--vim.cmd('set verbose=3')  -- Set verbose level to 3 for detailed messages
require("dt.base") -- General Settings
require("dt.highlights") -- Colourscheme and other highlights
require("dt.maps") -- Keymaps
require("dt.vimwiki") -- VimWiki Package
require("dt.plugins") -- Plugins
require("dt.bootstrap") -- Packer Auto-Installer
require("dt.telescope") -- Packer Auto-Installer
require("dt.ufo") -- Packer Auto-Installer
require("dt.gruvbox") -- Packer Auto-Installer
vim.cmd('colorscheme gruvbox') --Set colourscheme
require'nvim-treesitter.install'.compilers = {'clangd'} -- Set compilers for Treesitter
-- Save and copy
require("nvim-treesitter.configs").setup({
  -- ... other configurations ...
   highlight = {
    enable = true, -- Enable Treesitter highlighting
  },
  })

