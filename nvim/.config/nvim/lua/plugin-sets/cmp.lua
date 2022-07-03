-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- icons
local lspkind = require('plugin-sets.lspkind')

local cmp = require'cmp'
cmp.setup({
    snippet = {
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body)
			require'luasnip'.lsp_expand(args.body)
    end,
  },


	mapping = {
--     ['<C-p>'] = cmp.mapping.select_prev_item(),
--     ['<C-n>'] = cmp.mapping.select_next_item(),
     ['<S-TAB>'] = cmp.mapping.select_prev_item(),
     ['<TAB>'] = cmp.mapping.select_next_item(),
--   	['<S-TAB>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
-- 		['<TAB>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
	},

	formatting = {
	   format = lspkind.cmp_format({with_text = false, maxwidth = 50})

 	--	format = function(entry, vim_item)
	--		vim_item.kind = lspkind.presets.default[vim_item.kind]

		-- add source info
	  --  vim_item.menu = ({
		--		buffer = "[Buffer]",
		--		nvim_lsp = "[LSP]",
		--		luasnip = "[LuaSnip]",
		--		nvim_lua = "[Lua]",
		--		latex_symbols = "[Latex]",
		--	})[entry.source.name]

		--	return vim_item
		--end
	},

	experimental = {
		native_menu = false,
	--	ghost_text = true,
	},

	sources = {
		{ name = 'nvim_lsp' },
		-- { name = 'vsnip' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'path' },
	},

})

require'luasnip'.filetype_extend("dart", {"flutter"})
require("luasnip/loaders/from_vscode").lazy_load()
