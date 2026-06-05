return {
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000,
        config = function()
            require("tiny-inline-diagnostic").setup({
                preset = "classic",
                transparent_bg = true,
                options = {
                    add_messages = {
                        display_count = true,
                    },
                    multilines = {
                        enabled = true,
                    },
                }
            })
        end,
    }
}
