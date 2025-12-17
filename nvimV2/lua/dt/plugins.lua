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
    
	-- Floating terminal
	use ({"akinsho/toggleterm.nvim",
	   config = function()
		require("toggleterm").setup{
			        -- the size of a quarter of the screen
					size = function(term)
						if term.direction == "vertical" then
							return vim.o.columns * 0.50 -- Half of the screen's width
						elseif term.direction == "horizontal" then
							return vim.o.lines * 0.5 -- Half of the screen's height (if horizontal)
						end
					end,
					direction='vertical', -- | 'vertical' | 'window' | 'float',
					open_mapping = [[<c-t>]], --open the terminal with <c-t>,
                    broder='curved'
				}
	  end })


    use ({
        'rcarriga/nvim-notify',
        config=function()
            require ("notify").setup({
                background_colour = "#000000",
                           })
        end,
        })

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
          concat=" GRUPO ELEKTRA "},
        shortcut = {},
        footer = {
          '',
          "Daniel Vallejo Aldana -   danielvallejo237 "
        },
      },
    }
  end,
  requires = {'nvim-tree/nvim-web-devicons'}
}
   -- Noice is a notification plugin 
   use({
      "folke/noice.nvim",
      requires = {"MunifTanjim/nui.nvim","rcarriga/nvim-notify"},
      config = function()
        require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false}
       })
      end
      })
 
	-- Telescope
	use({
	    "nvim-telescope/telescope.nvim",
        tag="0.1.5",
        requires = { { "nvim-lua/plenary.nvim" } },
	    })
	use("nvim-telescope/telescope-file-browser.nvim")

    --monokai pro theme
    use({"loctvl842/monokai-pro.nvim",
        config = function()
            require("monokai-pro").setup({filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
  				-- Enable this will disable filter option
 		 day_night = {
			 enable = true, -- turn off by default
    		day_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
    		night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
  		}})
        end
    })
	use("nvim-treesitter/nvim-treesitter") -- Treesitter Syntax Highlighting
	-- Productivity
	use("vimwiki/vimwiki")
	use("jreybert/vimagit")
	use("nvim-orgmode/orgmode")   
 
    -- Paquete para el colapso del código para hacer más eficiente la programación
    use ({'kevinhwang91/promise-async'})
    use ({'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'})

	use("folke/which-key.nvim") -- Which Key
	use("nvim-lualine/lualine.nvim") -- A better statusline
    use("lukas-reineke/indent-blankline.nvim") -- Indent lines
	-- File management --
    use ({"neoclide/coc.nvim",branch='release',run="npm ci"}) -- Autocompletion and LSP
    use("vifm/vifm.vim")
	use("scrooloose/nerdtree")
	use("tiagofumo/vim-nerdtree-syntax-highlight")
	use("ryanoasis/vim-devicons")
	use({ "diegoulloao/neofusion.nvim" })
	-- lspconfig --
	use({"neovim/nvim-lspconfig"}) -- Collection of configurations for built-in LSP client
    use({"williamboman/mason.nvim"})
    use({"williamboman/mason-lspconfig.nvim"})
	-- Tim Pope Plugins --
	use("tpope/vim-surround")
    use({"ellisonleao/gruvbox.nvim"})
	-- Syntax Highlighting and Colors --
	use("mboughaba/i3config.vim")
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
    -- Block decomposition --
    use({
        'Wansmer/treesj',
        config= function() require('treesj').setup({ use_default_keymaps=true }) end,
    })
    -- Automatic code format ---------------
    use ("vim-autoformat/vim-autoformat")
	if packer_bootstrap then
		packer.sync()
	end
end)
