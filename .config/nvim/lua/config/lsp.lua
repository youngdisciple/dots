-- CONFIG
-- file watcher (important for sourcemap changes to be detected)
vim.lsp.config("*", {
    capabilities = {
        workspace = {
            didChangeWatchedFiles = {
                dynamicRegistration = true,
            },
        },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, opts)
    end,
})

-- lua
vim.lsp.config.lua_ls = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    globals = { "vim" },
    capabilities = {
        offsetEncoding = {"utf-8"},
        general = {
            positionEncodings = {"utf-8"}
        }
    },
}

-- php

vim.lsp.config.phpactor = {
    cmd = { "phpactor", "language-server" },
    filetypes = { "php" },
    root_markers = { "composer.json" }
}

-- jdtls

vim.lsp.config.jdtls = {
    cmd = { "jdtls" },
    filetypes = {"java"}
}

-- ts-server

vim.lsp.config.ts_server = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = {"javascript", "typescript"}
}

-- texlab
vim.lsp.config.texlab = {
    cmd = { "texlab" },
    filetypes = { "tex", "bib" }
}

-- go

vim.lsp.config.gopls = {
    cmd = { "gopls" },
    filetypes = { "go" },
    settings = {
        gopls = {
            usePlaceholders = false,
            completeUnimported = true
        }
    }
}

-- ENABLE

vim.lsp.enable({"lua_ls", "phpactor", "ts_server", "jdtls", "texlab", "gopls"})
