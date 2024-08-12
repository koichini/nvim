require "nvchad.options"

-- add yours here!
vim.opt.relativenumber = true
-- vim.opt.tabstop = 4
-- vim.opt.shiftwidth = 4

-- ファイルタイプ指定の設定
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = false
  end,
})

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
