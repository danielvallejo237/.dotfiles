-- Llamamos a la instalacion de los iconos que necesitamos

local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
    augroup packer_user_config
      autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup END
]])
packer.startup(function(use)

    --Github copilot---
    use("github/copilot.vim")
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

    --Load an icon for the footer of the dashboard
    use("kyazdani42/nvim-web-devicons")
    
	-- Commenting plugin
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	-- Floating terminal
	use ({"akinsho/toggleterm.nvim",
	   config = function()
		require("toggleterm").setup{
			        -- the size of a quarter of the screen
					size = function(term)
						if term.direction == "vertical" then
							return vim.o.columns * 0.5 -- Half of the screen's width
						elseif term.direction == "horizontal" then
							return vim.o.lines * 0.5 -- Half of the screen's height (if horizontal)
						end
					end,
					direction='vertical',
					open_mapping = [[<c-t>]] --open the terminal with <c-t>
				}
	  end })

	-- Dashboard is a nice start screen for nvim
   use{
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = "hyper",
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {},
        footer = {
          '',
          "Daniel Vallejo Aldana 󰺛    - Computer Scientist  󰺛"
        },
      },
    }
  end,
  requires = {'nvim-tree/nvim-web-devicons'}
}
	-- Telescope
	use({
	    "nvim-telescope/telescope.nvim",
        tag="0.1.5",
        requires = { { "nvim-lua/plenary.nvim" } },
	    })
	use("nvim-telescope/telescope-file-browser.nvim")

	use("nvim-treesitter/nvim-treesitter") -- Treesitter Syntax Highlighting
	-- Productivity
	use("vimwiki/vimwiki")
	use("jreybert/vimagit")
	use("nvim-orgmode/orgmode")

	use("folke/which-key.nvim") -- Which Key
	use("nvim-lualine/lualine.nvim") -- A better statusline

	-- File management --
    use("vifm/vifm.vim")
	use("scrooloose/nerdtree")
	use("tiagofumo/vim-nerdtree-syntax-highlight")
	use("ryanoasis/vim-devicons")

	-- Tim Pope Plugins --
	use("tpope/vim-surround")

	-- Syntax Highlighting and Colors --
	use("PotatoesMaster/i3-vim-syntax")
	use("kovetskiy/sxhkd-vim")
	use("vim-python/python-syntax")
	use("ap/vim-css-color")
	use("nickeb96/fish.vim")

	-- Junegunn Choi Plugins --
	use("junegunn/goyo.vim")
	use("junegunn/limelight.vim")
	use("junegunn/vim-emoji")

	-- Colorschemes --
	use("RRethy/nvim-base16")
	use("kyazdani42/nvim-palenight.lua")

	-- Other stuff --
	use("frazrepo/vim-rainbow")


	if packer_bootstrap then
		packer.sync()
	end
end)
