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

-- buffers
map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<leader>bx", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "close current buffer" })

map("n", "<leader>bc", function()
  require("nvchad.tabufline").closeAllBufs(false)
end, { desc = "close other buffers" })

map("n", "<leader>bl", function()
  require("nvchad.tabufline").closeBufs_at_direction ("left")
end, { desc = "close buffers at left" })

map("n", "<leader>br", function()
  require("nvchad.tabufline").closeBufs_at_direction ("right")
end, { desc = "close buffers at right" })

map("n", "<leader>bC", function()
  require("nvchad.tabufline").closeAllBufs(true)
end, { desc = "close all buffers" })

-- unset
nomap("n", "<tab>")
nomap("n", "<S-tab>")
nomap("n", "<leader>x")
nomap("n", "<leader>b")