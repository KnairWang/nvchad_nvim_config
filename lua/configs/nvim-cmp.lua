local options = require "nvchad.configs.cmp"
local cmp = require "cmp"
local types = require "cmp.types"

options.sources = {
  { name = "nvim_lsp" },
  { name = "luasnip" },
  -- { name = "buffer" },
  -- { name = "nvim_lua" },
  { name = "path" },
}

local function prioritize(kind, higher)
  return function(entry1, entry2)
    local kind1 = entry1:get_kind()
    local kind2 = entry2:get_kind()
    if kind1 ~= kind2 then
      if kind1 == kind then
        return higher
      elseif kind2 == kind then
        return not higher
      end
    end
    return nil
  end
end

local function symbol(entry1, entry2)
  local word1 = entry1:get_word()
  local word2 = entry2:get_word()
  if word1 and word2 then
    local start1 = string.find(word1, "%w+")
    local start2 = string.find(word2, "%w+")
    if type(start1) == "number" and type(start2) == "number" and start1 ~= start2 then
      return start1 < start2
    end
  end
end

local function lexicographical(entry1, entry2)
  local word1 = entry1:get_word()
  local word2 = entry2:get_word()
  if word1 and word2 then
    local order = vim.stricmp(word1, word2)
    if type(order) == "number" and order ~= 0 then
      return order < 0
    end
  end
end

local function abbreviateString(str, maxwidth, ellipsis_char)
  if vim.fn.strchars(str) > maxwidth then
    str = vim.fn.strcharpart(str, 0, maxwidth) .. (ellipsis_char ~= nil and ellipsis_char or "")
  end

  return str
end



options.completion.completeopt = "menu,menuone,noselect"
options.preselect = cmp.PreselectMode.None

options.sorting = {
  priority_weight = 10,
  comparators = {
    cmp.config.compare.exact,
    symbol,

    prioritize(types.lsp.CompletionItemKind.Snippet, false),

    -- prioritize(types.lsp.CompletionItemKind.Field, true),
    -- prioritize(types.lsp.CompletionItemKind.Property, true),
    -- prioritize(types.lsp.CompletionItemKind.Method, true),

    -- prioritize(types.lsp.CompletionItemKind.Variable, true),
    -- prioritize(types.lsp.CompletionItemKind.Function, true),
    -- prioritize(types.lsp.CompletionItemKind.Class, true),
    -- prioritize(types.lsp.CompletionItemKind.Struct, true),
    -- prioritize(types.lsp.CompletionItemKind.Module, true),

    -- cmp.config.compare.kind,

    -- cmp.config.compare.scopes,
    cmp.config.compare.sort_text,
    -- cmp.config.compare.locality,
    -- cmp.config.compare.order,

    -- cmp.config.compare.score,
    -- cmp.config.compare.length,
    -- cmp.config.compare.offset,
    -- cmp.config.compare.recently_used,

    lexicographical,
  },
}

options.formatting.fields = { "abbr", "kind", "menu" }
options.formatting.expandable_indicator = true
local format = options.formatting.format
options.formatting.format = function(entry, vim_item)
  local item = format(entry, vim_item)
  item.menu = abbreviateString(item.menu, 60, "...")
  return item
end

return options
