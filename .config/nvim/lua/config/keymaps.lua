local opts = { silent = true }
local function opt(desc, others)
    return vim.tbl_extend("force", opts, { desc = desc }, others or {})
end

local map = vim.keymap.set

---- FILE EXPLORER ---------------------------------------------------------
map("n", "<leader>c", "<Cmd>lua MiniFiles.open()<CR>", opt("Files"))

---- BUFFER ----------------------------------------------------------------

-- Write
map("n", "<leader>w", function()
    vim.cmd("silent! write!")
    vim.notify("Wrote.")
end, opt("Save"))

-- Quit
map("n", "<leader>q", "<Cmd>q!<CR>", opt("Quit"))

map("n", "<leader>[", ":bp<CR>", opt("Go to previous buffer"))
map("n", "<leader>]", ":bn<CR>", opt("Go to next buffer"))
map("n", "<leader>bb", ":e #<CR>", opt("Go to last buffer"))
map("n", "<leader>x", ":bd<CR>", opt("Close tab"))
map("n", "<leader>X", function()
    local current = vim.fn.bufnr("%")
    vim.cmd("silent! %bd")
    vim.cmd("buffer " .. current)
end, opt("Close all but current tab"))
---- TABS ------------------------------------------------------------------
map("n", "<leader>1", "1gt", opt("Go to tab 1"))
map("n", "<leader>2", "2gt", opt("Go to tab 2"))
map("n", "<leader>3", "3gt", opt("Go to tab 3"))
map("n", "<leader>4", "4gt", opt("Go to tab 4"))
map("n", "<leader>5", "5gt", opt("Go to tab 5"))

---- TELESCOPE -------------------------------------------------------------
map("n", "<leader>f", "<cmd>Telescope find_files<cr>", opt("Find Files"))
map("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opt("Live Grep"))
map("n", "<leader>h", "<cmd>Telescope help_tags<cr>", opt("Telescope Grep Help"))
