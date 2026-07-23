local opts = { silent = true }
local function opt(desc, others)
    return vim.tbl_extend("force", opts, { desc = desc }, others or {})
end

local map = vim.keymap.set

---- FILE EXPLORER ---------------------------------------------------------
map("n", "<leader>c", "<Cmd>lua MiniFiles.open()<CR>", opt("Files"))

---- BUFFER ----------------------------------------------------------------

-- Reload buffer (for lsp hallucinations)
map("n", "<leader>e", function ()
    local ok = pcall(vim.cmd, "edit")
    if ok then
        vim.notify("Reloaded.")
    else
        vim.notify("Not reloaded, unsaved changes.", vim.log.levels.WARN)
    end
end, opt("Reload Buffer"))

-- Write
map("n", "<leader>w", function()
    vim.cmd("silent! write!")
    vim.notify("Wrote.")
end, opt("Save"))

-- OS clipboard copy
map({"n", "v"}, "<leader>y", '"+y', opt("Copy to OS Clipboard"))
map({"n", "v"}, "Y", '"+Y', opt("Copy to OS Clipboard"))

-- OS clipboard paste
map({"n"}, "<leader>p", '"+p', opt("Paste to OS Clipboard"))

-- Quit
map("n", "<leader>q", "<Cmd>q!<CR>", opt("Quit"))

map("n", "<leader>[", ":bp<CR>", opt("Go to previous buffer"))
map("n", "<leader>]", ":bn<CR>", opt("Go to next buffer"))
map("n", "<leader>x", ":bd<CR>", opt("Close tab"))
map("n", "<leader>X", function()
    local current = vim.fn.bufnr("%")
    vim.cmd("silent! %bd")
    vim.cmd("buffer " .. current)
end, opt("Close all but current tab"))

---- TELESCOPE -------------------------------------------------------------
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", opt("Find Files"))
map("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opt("Live Grep"))
map("n", "<leader>r", "<cmd>Telescope oldfiles<CR>", opt("Recent Files"))
map("n", "<leader>b", "<cmd>Telescope buffers<cr>", opt("Buffer Files"))
map("n", "<leader>h", "<cmd>Telescope help_tags<cr>", opt("Telescope Grep Help"))
