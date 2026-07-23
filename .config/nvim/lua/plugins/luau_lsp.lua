return {
    "lopi-py/luau-lsp.nvim",
    ft = {'luau'},
    opts = {
        platform = {
            type = "roblox",
        },
        sourcemap = {
            enabled = true,
            autogenerate = true,
            rojo_project_file = "default.project.json",
            sourcemap_file = "sourcemap.json",
        },
        types = {
            roblox_security_level = "PluginSecurity",
        },
        fflags = {
            sync = true,
        },
        plugin = {
            enabled = true,
            port = 3667,
        },
    },
}
