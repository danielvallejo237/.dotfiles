-- In your init.lua file
local opts = { noremap = true, silent = true }
-- Trigger completion with <C-Space>
vim.cmd('highlight Comment cterm=bold') -- Italicize comments
vim.cmd('syntax on') -- Enable syntax highlighting
require("dt.base") -- General Settings
require("dt.highlights") -- Colourscheme and other highlights
require("dt.maps") -- Keymaps
require("dt.plugins") -- Plugins
require("dt.bootstrap") -- Packer Auto-Installer
require("dt.telescope") -- Packer Auto-Installer
require("dt.ufo") -- Packer Auto-Installer
require("dt.gruvbox") -- Packer Auto-Installer
vim.cmd('colorscheme gruvbox') -- Set colourscheme
require'nvim-treesitter.install'.compilers = { 'gcc' }
-- Save and copy
require("nvim-treesitter.configs").setup({
  -- ... other configurations ...
  highlight = {
    enable = true, -- Enable Treesitter highlighting
  }
})
