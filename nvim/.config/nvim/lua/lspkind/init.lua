local lspkind = {}
local fmt = string.format

local kind_presets = {
  default = {
-- if you change or add symbol here
-- replace corresponding line in readme
    Text = " (text)",
    Method = " (method)",
    Function = " (function)",
    Constructor = " (constructor)",
    Field = "ﰠ (field)",
    Variable = " (variable)",
    Class = "ﴯ (class)",
    Interface = " (interface)",
    Module = " (module)",
    Property = "ﰠ (property)",
    Unit = "塞(unit)",
    Value = " (value)",
    Enum = " (enum)",
    Keyword = " (keyword)",
    Snippet = " (snippet)",
    Color = " (color)",
    File = " (file)",
    Reference = " (reference)",
    Folder = " (folder)",
    EnumMember = " (enum member)",
    Constant = " (const)",
    Struct = "פּ (sruct)",
    Event = " (event)",
    Operator = " (operator)",
    TypeParameter = ""
  },
}

local kind_order = {
  'Text', 'Method', 'Function', 'Constructor', 'Field', 'Variable', 'Class', 'Interface', 'Module',
  'Property', 'Unit', 'Value', 'Enum', 'Keyword', 'Snippet', 'Color', 'File', 'Reference', 'Folder',
  'EnumMember', 'Constant', 'Struct', 'Event', 'Operator', 'TypeParameter'
}

function lspkind.init(opts)
  local with_text = opts == nil or opts['with_text']

  local preset
  if opts == nil or opts['preset'] == nil then
    preset = 'default'
  else
    preset = opts['preset']
  end

  local symbol_map = kind_presets[preset]
  local symbol_map = (opts and opts['symbol_map'] and
                       vim.tbl_extend('force', symbol_map, opts['symbol_map'])) or symbol_map

  local symbols = {}
  local len = 25
  if with_text == true or with_text == nil then
    for i = 1, len do
      local name = kind_order[i]
      local symbol = symbol_map[name]
      symbol = symbol and (symbol .. ' ') or ''
      symbols[i] = fmt('%s%s', symbol, name)
    end
  else
    for i = 1, len do
      local name = kind_order[i]
      symbols[i] = symbol_map[name]
    end
  end

  for k,v in pairs(symbols) do
    require('vim.lsp.protocol').CompletionItemKind[k] = v
  end
end

lspkind.presets = kind_presets

return lspkind
