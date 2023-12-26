local set = vim.opt

-- General Settings
set.number=true
set.relativenumber=true			-- Line numnbers relative current line
set.scrolloff=8							-- Lines auto scroll up/down before hit bottom/top page
set.wrap=false              -- Display long lines as just one line
set.mouse='a'             	-- Enable your mouse
set.splitbelow=true         -- Horizontal splits will automatically be below
set.splitright=true         -- Vertical splits will automatically be to the right

set.expandtab=true
set.tabstop=2           		-- Insert 2 spaces for a tab
set.softtabstop=2
set.shiftwidth=2        		-- Change the number of space characters inserted for indentation
set.smarttab=true           -- Makes tabbing smarter will realize you have 2 vs 4
set.smartindent=true        -- Makes indenting smart
set.smartcase=true					-- Case sensitive search
set.autoindent=true         -- Good auto indent
-- set.foldmethod=indent		-- Folds lines of code by indent

set.hlsearch=false					-- Dont highlight words for search

set.hidden=true							-- Keep buffers open in background
set.swapfile=false

set.clipboard=unnamedplus 	-- Copy paste between vim and everything else

-- Allow php varibales
--set.iskeyword=@,48-57,_,192-255,$
set.iskeyword:append('$')

-- Colors
set.termguicolors=true
set.background='dark'
