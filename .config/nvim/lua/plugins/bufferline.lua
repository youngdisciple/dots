return {
    "akinsho/bufferline.nvim",
    lazy = false,
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffer",
                numbers = "ordinal",
                filter_func = function(buf, _)
                    return buf.name ~= ""
                end,
            }
        })
    end,
    keys = {
        { "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>" },
        { "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>" },
        { "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>" },
        { "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>" },
        { "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>" },
    }
}
