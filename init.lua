local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}
require("vim-options")
require("lazy").setup("plugins")

--vim.api.nvim_create_autocmd("BufWritePost", {
--    pattern = "*.rst",
--    callback = function()
--        -- Use Pandoc to convert reST to HTML
--        local input = vim.fn.expand("%:p")
--        local output = vim.fn.expand("%:p:r") .. ".md"
--        os.execute("pandoc " .. input .. " -f rst -t markdown -s -o " .. output)
--        -- Open Peek preview if not already open
--        require("peek").open()
--    end,
--})
