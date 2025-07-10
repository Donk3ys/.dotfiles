
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- General
  'nvim-lua/plenary.nvim',

  -- Buffers
  'romgrk/barbar.nvim',

  -- Comments
  'folke/todo-comments.nvim',

  -- Auto Complete
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  'rafamadriz/friendly-snippets',
  'windwp/nvim-autopairs',

  -- Debug
  'leoluz/nvim-dap-go',
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
  'folke/neodev.nvim', -- suggested for "rcarriga/nvim-dap-ui"
  'theHamsta/nvim-dap-virtual-text',
  'mxsdev/nvim-dap-vscode-js',
  {
    "microsoft/vscode-js-debug",
    build = "npm install --legacy-peer-deps && npm run compile"
  },

  -- File Explore
  'nvim-telescope/telescope.nvim',
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  "stevearc/oil.nvim",

  -- Folds
  'kevinhwang91/nvim-ufo',
  'kevinhwang91/promise-async',

  -- Git
  'lewis6991/gitsigns.nvim',
  'kdheepak/lazygit.nvim',
  'sindrets/diffview.nvim',

  -- Generator
  { 'wa11breaker/dart-data-class-generator.nvim', dependencies = {"nvimtools/none-ls.nvim"} },

  -- Lsp
  'neovim/nvim-lspconfig',
  'akinsho/flutter-tools.nvim',
  {
    "luckasRanarison/tailwind-tools.nvim",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      { "nvim-telescope/telescope.nvim", opt = true },
      { "neovim/nvim-lspconfig", opt = true },
    },
  },

  -- Mason
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  -- Terminal
  'akinsho/toggleterm.nvim',

  -- Tree Sitter
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},

  ---- UI
  "lukas-reineke/indent-blankline.nvim",
  'sainnhe/gruvbox-material',
  'kyazdani42/nvim-web-devicons',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },
  'petertriho/nvim-scrollbar',
  'j-hui/fidget.nvim',
  'RRethy/vim-illuminate',
  'rcarriga/nvim-notify',
  'fei6409/log-highlight.nvim',
  'brenoprata10/nvim-highlight-colors',
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig"
  },

  -- Other
  'grafana/vim-alloy'
})
