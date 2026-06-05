return {
    'nvim-flutter/flutter-tools.nvim',
    ft = {"dart"},
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
        require("flutter-tools").setup({
            dev_log = {
                enabled = true,
                notify_errors = true,
                open_cmd = "tabedit",  -- or "float", "botright vnew", "topleft new", etc.
            },
        })
    end,
}
