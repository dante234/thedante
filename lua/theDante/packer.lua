-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	-- or                            , branch = '0.1.x',
  	requires = { {'nvim-lua/plenary.nvim'} }
            }
    use {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
    }
    use { "catppuccin/nvim", as = "catppuccin" }
	use( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use( 'nvim-treesitter/playground')
	use( 'ThePrimeagen/harpoon')
    use( 'nvim-tree/nvim-tree.lua')
    use( 'nvim-tree/nvim-web-devicons')
    use( 'nvim-lualine/lualine.nvim')
    use{ 'akinsho/bufferline.nvim'}
    use{ 'windwp/nvim-autopairs'}
    use{ 'windwp/nvim-ts-autotag'}
    use{ 'lukas-reineke/indent-blankline.nvim'}
    use{'jose-elias-alvarez/null-ls.nvim'}
    use{'tpope/vim-fugitive'}
    use{'rcarriga/nvim-notify'}
    use{'norcalli/nvim-colorizer.lua'}
    use{'epwalsh/obsidian.nvim',
        tag = "*",
        requires={'nvim-lua/plenary.nvim'}
    }
	use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
  	requires = {
   	 -- LSP Support
    	 {'neovim/nvim-lspconfig'},             -- Required
    	 {'williamboman/mason.nvim'},           -- Optional
    	 {'williamboman/mason-lspconfig.nvim'}, -- Optional

   	 -- Autocompletion
   	     {'hrsh7th/nvim-cmp'},-- Required
         {'hrsh7th/cmp-buffer'},-- Required
         {'hrsh7th/cmp-path'}, -- Required
         {'saadparwaiz1/cmp_luasnip'},
    	 {'hrsh7th/cmp-nvim-lsp'},  -- Required
    	 {'hrsh7th/cmp-nvim-lua'}, -- Required
     -- Snippets
    	 {'L3MON4D3/LuaSnip'},-- Required
         {'rafamadriz/friendly-snippets'},-- Required
            -- Añadir lspkind para íconos en las sugerencias
      { 'onsails/lspkind-nvim' }, -- Aquí añades lspkind
  	}
}

     end)
