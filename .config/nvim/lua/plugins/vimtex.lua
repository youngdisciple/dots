return {
    "lervag/vimtex",
    ft = { "tex" },
    init = function()
        vim.g.vimtex_view_method = "zathura"

        vim.g.vimtex_compiler_latexmk = {
            executable = "latexmk",
            engine = "-xelatex",
            options = {
                "-verbose",
                "-file-line-error",
                "-synctex=1",
                "-interaction=nonstopmode",
            },
        }
    end,
}
