return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    config = function()
        local parsers = { 'lua', 'luau', 'php', 'java', 'dart', 'bash' };
        local filetypes = { 'lua', 'luau', 'php', 'java', 'dart', 'sh' };
        require('nvim-treesitter').setup {}
        require('nvim-treesitter').install(parsers)
        vim.api.nvim_create_autocmd('FileType', {
            pattern = filetypes,
            callback = function() vim.treesitter.start() end,
        })
        vim.api.nvim_create_autocmd('FileType', {
            pattern = filetypes,
            callback = function()
                vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                vim.wo[0][0].foldmethod = 'expr'
            end,
        })
        vim.api.nvim_create_autocmd('FileType', {
            pattern = filetypes,
            callback = function()
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
        vim.api.nvim_create_autocmd('User', { pattern = 'TSUpdate',
            callback = function()
                require('nvim-treesitter.parsers').templ = {
                    install_info = {
                        url = 'https://github.com/vrischmann/tree-sitter-templ.git',
                        files = { 'src/parser.c', 'src/scanner.c' },
                        branch = 'master',
                    },
                }
            end
        })
        vim.treesitter.language.register('templ', 'templ')
    end,
}
