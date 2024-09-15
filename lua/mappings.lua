require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local nomap = vim.keymap.del

-- unset
nomap("n", "<tab>")
nomap("n", "<S-tab>")
nomap("n", "<leader>x")
nomap("n", "<leader>b")
nomap("n", "<C-n>")
nomap("n", "<leader>h")
nomap("n", "<leader>v")
nomap("n", "<leader>n")
nomap("n", "<leader>th")
-- nomap("n", "<leader>D")

-- map("n", ";", ":", { desc = "CMD enter command mode" })
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

-- qf quick fix
map("n", "<leader>cx", "<cmd>cclose<CR>", { desc = "close qf" })

-- diagnostics
map("n", "<leader>df", vim.diagnostic.open_float, { desc = "Show diagnostics in a floating window" })

-- nvimtree
-- map("n", "<A-n>", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- netrw
-- map("n", "<leader>e", "<cmd>Lexplore<CR>", { desc = "netrw toggle window" })
