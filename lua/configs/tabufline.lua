local tabufline = require "nvchad.tabufline"

local map = vim.keymap.set

map("n", "<A-j>", function()
  tabufline.prev()
end)
map("n", "<A-k>", function()
  tabufline.next()
end)
