return require'packer'.startup(function()
	-- General
  use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'

	-- Buffers
	-- use 'romgrk/barbar.nvim'

	-- Comments
	use 'numToStr/Comment.nvim'
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use 'folke/todo-comments.nvim'

	-- Auto Complete
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use 'rafamadriz/friendly-snippets'
	use 'windwp/nvim-autopairs'

	-- Debug
	use 'leoluz/nvim-dap-go'
	use 'mfussenegger/nvim-dap'
	use 'rcarriga/nvim-dap-ui'
	use 'theHamsta/nvim-dap-virtual-text'

	-- File Explore
	use 'nvim-telescope/telescope.nvim'
	-- use 'nvim-telescope/telescope.nvim', { 'commit': '2b8c7b1ec7a3b27f1d24478c404ce4b2a82cc055' }
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use 'nvim-telescope/telescope-file-browser.nvim'

	-- Folds
	-- use 'kevinhwang91/nvim-ufo'
	-- use 'kevinhwang91/promise-async'

	-- Git
	use 'lewis6991/gitsigns.nvim'
	use 'kdheepak/lazygit.nvim'
	use 'f-person/git-blame.nvim'
	use 'sindrets/diffview.nvim'

	-- lsp
	use 'neovim/nvim-lspconfig'
	use 'akinsho/flutter-tools.nvim'
	use 'simrat39/rust-tools.nvim'

	-- Terminal
	use 'akinsho/toggleterm.nvim'

	-- Tree Sitter
 	 use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	---- UI
	use 'sainnhe/gruvbox-material'
	use 'kyazdani42/nvim-web-devicons'
	use 'NTBBloodbath/galaxyline.nvim'
	use 'petertriho/nvim-scrollbar'
	use 'j-hui/fidget.nvim'
	use 'RRethy/vim-illuminate'
	use 'rcarriga/nvim-notify'
end)
