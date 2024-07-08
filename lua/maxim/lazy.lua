local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
require("maxim.remap")
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

local ok, lazy = pcall(require, "lazy")
if not ok then
    return
end


lazy.setup({
    spec = "plugins",
    change_detection = { notify = false }
})


vim.keymap.set("n", "<leader>L", lazy.show)
