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

vim.api.nvim_create_autocmd("User", {
    pattern = "MiniFilesBufferCreate",
    callback = function(args)
        local buf = args.data.buf_id
        vim.keymap.set("n", "l", function()
            local entry = MiniFiles.get_fs_entry()
            if not entry then return end
            if entry.fs_type == "directory" then
                MiniFiles.go_in()
            else
                MiniFiles.close()
                vim.cmd("tabedit " .. vim.fn.fnameescape(entry.path))
            end
        end, { buffer = buf })
    end,
})
