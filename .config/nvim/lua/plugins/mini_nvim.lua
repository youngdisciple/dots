return {
    'nvim-mini/mini.nvim',
    version = false,
    config = function()
        -- animate
        local animate = require("mini.animate")
        animate.setup({
            subscroll = animate.gen_subscroll.equal({ max_output_steps = 120 }),
        })
        -- pairs
        local pairs = require("mini.pairs")
        pairs.setup({})
        -- surround
        local surround = require("mini.surround")
        surround.setup({ n_lines = 100 })
        -- completion
        local completion = require("mini.completion")
        completion.setup({})
        -- files
        local files = require("mini.files")
        files.setup({})
    end
}

