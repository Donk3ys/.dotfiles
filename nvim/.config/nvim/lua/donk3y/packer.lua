return require'packer'.startup(function()
	-- General
  use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'

	-- Buffers
	use 'romgrk/barbar.nvim'

	-- Comments
	use 'folke/todo-comments.nvim'

  -- AI
  use("olimorris/codecompanion.nvim")

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
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
  use 'folke/neodev.nvim' -- suggested for "rcarriga/nvim-dap-ui"
	use 'theHamsta/nvim-dap-virtual-text'
	use 'mxsdev/nvim-dap-vscode-js'
	use {
		"microsoft/vscode-js-debug",
		opt = true,
		run = "npm install --legacy-peer-deps && npm run compile" 
	}

	-- File Explore
	use 'nvim-telescope/telescope.nvim'
	-- use 'nvim-telescope/telescope.nvim', { 'commit': '2b8c7b1ec7a3b27f1d24478c404ce4b2a82cc055' }
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use("stevearc/oil.nvim")

	-- Folds
	use 'kevinhwang91/nvim-ufo'
	use 'kevinhwang91/promise-async'

	-- Git
	use 'lewis6991/gitsigns.nvim'
	use 'kdheepak/lazygit.nvim'
	use 'sindrets/diffview.nvim'

	-- Lsp
	use 'neovim/nvim-lspconfig'
	use 'akinsho/flutter-tools.nvim'
	use 'simrat39/rust-tools.nvim'

	-- Mason
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"

	-- Terminal
	use 'akinsho/toggleterm.nvim'

	-- Tree Sitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

	---- UI
	use "lukas-reineke/indent-blankline.nvim"
	use 'sainnhe/gruvbox-material'
	use 'kyazdani42/nvim-web-devicons'
	use 'NTBBloodbath/galaxyline.nvim'
	use 'petertriho/nvim-scrollbar'
	use 'j-hui/fidget.nvim'
	use 'RRethy/vim-illuminate'
	use 'rcarriga/nvim-notify'
  use 'fei6409/log-highlight.nvim'
  use 'brenoprata10/nvim-highlight-colors'
  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
}
end)

