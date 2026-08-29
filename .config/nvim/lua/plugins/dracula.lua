-- * Dracula
return {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    opts = {
        transparent_bg = true
    },
    config = function(_, opts)
        require("dracula").setup(opts)
        vim.cmd.colorscheme("dracula")
    end,
}
