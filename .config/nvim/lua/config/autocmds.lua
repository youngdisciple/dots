vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "__FLUTTER_DEV_LOG__",
    callback = function()
        vim.bo.buflisted = true
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "text", "tex", "lua" },
    callback = function (opts)
        vim.opt_local.spelllang = "en_us"
        vim.opt_local.spell = true
        vim.opt_local.wrap = true
        vim.opt_local.textwidth = 80
    end
})
