require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "]b", function()
    require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })
  
map("n", "[b", function()
    require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

nomap("n", "<tab>")
nomap("n", "<S-tab>")