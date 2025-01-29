require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Folke Zen-mode 
map("n", "<leader>tz", ":ZenMode<CR>", {desc = "Zen mode"})
map("i", "<A-f>", function()
    require("neocodeium").accept()
end)
map("i", "<A-w>", function()
    require("neocodeium").accept_word()
end)
map("i", "<A-a>", function()
    require("neocodeium").accept_line()
end)
map("i", "<A-e>", function()
    require("neocodeium").cycle_or_complete()
end)
map("i", "<A-r>", function()
    require("neocodeium").cycle_or_complete(-1)
end)
map("i", "<A-c>", function()
    require("neocodeium").clear()
end)
