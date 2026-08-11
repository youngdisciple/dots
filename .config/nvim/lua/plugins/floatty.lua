return {
    "ingur/floatty.nvim",
    config = function()
        _G.Floatty = require("floatty").setup({
            window = {
                row = function() 
                    return vim.o.lines - 11
                end,
                width = 1.0,
                height = 10
            }
        })
    end
}
