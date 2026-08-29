return {
    "dchinmay2/alabaster.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        transparent_bg = true
    },
    config = function()
        vim.g.alabaster_dim_comments = false
        vim.g.alabaster_floatborder = false
        vim.opt.background = "dark"
        vim.cmd.colorscheme("alabaster")
        -- Custom colors
        local transparent_groups = {
            "Normal", "NormalFloat", "SignColumn",
            "StatusLine", "StatusLineNC",
            "TabLine", "TabLineFill", "TabLineSel",
            "WinBar", "WinBarNC",
            "Pmenu",
        }
        for _, group in ipairs(transparent_groups) do
            vim.api.nvim_set_hl(0, group, { bg = "none" })
        end
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#a8485a" })
        vim.api.nvim_set_hl(0, "MiniFilesDirectory", { fg = "#a8485a" })

        -- Diagnostics: highlight instead of underline
        vim.diagnostic.config({
            underline = true,
        })

        local diag_hl = {
            DiagnosticUnderlineError = { bg = "#4b1e1e" },
            DiagnosticUnderlineWarn  = { bg = "#4a3c15" },
            DiagnosticUnderlineInfo  = { bg = "#1e3548" },
            DiagnosticUnderlineHint  = { bg = "#1e3d28" },
        }
        for name, hl in pairs(diag_hl) do
            hl.underline = false
            hl.undercurl = false
            vim.api.nvim_set_hl(0, name, hl)
        end
    end,
}
