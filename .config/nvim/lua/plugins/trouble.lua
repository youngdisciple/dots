return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    cmd = 'Trouble',
    keys = {
        { "<leader>td", "<cmd>Trouble diagnostics toggle<cr>", desc = "Project Diagnostics" },
        { "<leader>tD", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
        { "<leader>tt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
    },
}
