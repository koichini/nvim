require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "v" }, "<leader>gg", ":LazyGit<CR>", { desc = "Open LazyGit" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- GotoTab: Alt+1 ~ Alt+9 tab change
for i = 1, 9, 1 do
  vim.keymap.set("n", string.format("<A-%s>", i), function()
    vim.api.nvim_set_current_buf(vim.t.bufs[i])
  end)
end
