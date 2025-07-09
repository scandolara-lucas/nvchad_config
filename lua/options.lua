require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
--

vim.wo.relativenumber = true
vim.wo.scrolloff = 14
vim.wo.wrap = false

vim.opt.spelllang = "en_us"
vim.opt.spell = true

-- Don't check spelling on terminal windows
vim.api.nvim_create_autocmd("FileType", {
  pattern = "terminal",
  callback = function()
    vim.opt_local.spell = false
  end,
})
