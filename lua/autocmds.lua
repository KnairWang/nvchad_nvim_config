local group = vim.api.nvim_create_augroup("knairwang", { clear = true })
local win_cache = {}

vim.api.nvim_create_autocmd({ "WinNew" }, {
  group = group,
  callback = function()
    local win = vim.api.nvim_get_current_win()
    local win_config = vim.api.nvim_win_get_config(win)
    if win_config.relative ~= nil and win_config.relative ~= "" then
      print("set cache")
      win_cache[win].height = vim.api.nvim_win_get_height(win)
      win_cache[win].width = vim.api.nvim_win_get_width(win)
    end
  end
})

vim.api.nvim_create_autocmd({ "WinClosed" }, {
  group = group,
  callback = function()
    local win = vim.api.nvim_get_current_win()
    local win_config = vim.api.nvim_win_get_config(win)
    if win_config.relative ~= nil and win_config.relative ~= "" then
      print("clean cache")
      win_cache[win] = nil
    end
  end
})

-- nvim_create_autocmd(event[], options)
vim.api.nvim_create_autocmd({ "WinEnter" }, {
  group = group,
  callback = function()
    local win = vim.api.nvim_get_current_win()
    local win_config = vim.api.nvim_win_get_config(win)
    if win_config.relative == nil or win_config.relative == "" then
      print("use cache")
      for _, key in ipairs(win_cache) do
        if win == key then
          vim.api.nvim_win_set_height(key, win_cache[key].height + 5)
          vim.api.nvim_win_set_width(key, win_cache[key].width + 5)
        else
          vim.api.nvim_win_set_height(key, win_cache[key].height - 5)
          vim.api.nvim_win_set_width(key, win_cache[key].width - 5)
        end
      end
    end
  end
})

vim.api.nvim_create_autocmd({ "WinLeave" }, {
  group = group,
  callback = function()
    local win = vim.api.nvim_get_current_win()
    local win_config = vim.api.nvim_win_get_config(win)
    if win_config.relative == nil or win_config.relative == "" then
      for _, key in ipairs(win_cache) do
        print("use cache")
        if win == key then
          vim.api.nvim_win_set_height(key, win_cache[key].height - 5)
          vim.api.nvim_win_set_width(key, win_cache[key].width - 5)
        else
          vim.api.nvim_win_set_height(key, win_cache[key].height + 5)
          vim.api.nvim_win_set_width(key, win_cache[key].width + 5)
        end
      end
    end
  end
})


