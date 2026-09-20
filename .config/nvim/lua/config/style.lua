vim.o.winborder = 'single'
vim.o.pumblend = 3
vim.o.winblend = 0

vim.o.cursorline = true
vim.o.cursorlineopt = 'number'

-- make the separator visible
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#7aa2f7", bg = "NONE", bold = true })

-- nicer line characters (Neovim 0.10+)
vim.opt.fillchars = {
  vert = "│", horiz = "─",
  horizup = "┴", horizdown = "┬",
  vertleft = "┤", vertright = "├", verthoriz = "┼",
}

-- diagnostics

vim.diagnostic.config({
  float = { border = 'single' },
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#7aa2f7", bg = "NONE" })
  end,
})

vim.cmd("doautocmd ColorScheme")
