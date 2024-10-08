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

local function lexicographical(entry1, entry2)
  if entry1:get_word() and entry2:get_word() then
    local diff = vim.stricmp(entry1:get_word(), entry2:get_word())
    if diff < 0 then
      return true
    elseif diff > 0 then
      return false
    end
  end
  return nil
end

options.completion.completeopt = "menu,menuone,noselect"
options.preselect = cmp.PreselectMode.None

options.sorting = {
  priority_weight = 10,
  comparators = {
    cmp.config.compare.exact,

    prioritize(types.lsp.CompletionItemKind.Snippet, false),

    prioritize(types.lsp.CompletionItemKind.Field, true),
    prioritize(types.lsp.CompletionItemKind.Property, true),
    prioritize(types.lsp.CompletionItemKind.Method, true),

    prioritize(types.lsp.CompletionItemKind.Variable, true),
    prioritize(types.lsp.CompletionItemKind.Function, true),
    prioritize(types.lsp.CompletionItemKind.Class, true),
    prioritize(types.lsp.CompletionItemKind.Struct, true),
    prioritize(types.lsp.CompletionItemKind.Module, true),

    cmp.config.compare.kind,

    cmp.config.compare.scopes,
    -- cmp.config.compare.sort_text,
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
  local vim_item = format(entry, vim_item)

  -- local maxwidth = type(opts.maxwidth) == "function" and opts.maxwidth() or opts.maxwidth
  local maxwidth = 20
  if vim.fn.strchars(vim_item.abbr) > maxwidth then
    vim_item.abbr = vim.fn.strcharpart(vim_item.abbr, 0, maxwidth) .. "…"
  end

  -- if vim.fn.strchars(vim_item.kind) > 12 then
  --   vim_item.kind = vim.fn.strcharpart(vim_item.kind, 0, 12)
  -- end

  local maxwidth = 60
  if vim.fn.strchars(vim_item.menu) > maxwidth then
    vim_item.menu = vim.fn.strcharpart(vim_item.menu, 0, maxwidth)
    -- vim_item.menu = ""
  end

  return vim_item
end

return options
