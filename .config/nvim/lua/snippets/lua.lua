local ls = require "luasnip"

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local sn = ls.snippet_node

local snippets = {
    s('loc', {
        t('local '), i(1, ''), t(' = '), i(0)
    }),
    s('req', {
        t('local '), i(1, ''), t(" = require('"),
        d(2, function(args)
            return sn(nil, { i(1, args[1][1]) })
        end, { 1 }),
        t("')")
    }),
    s('lf', {
        t('local function '), i(1, ''), t('('), i(2, ''), t(')'),
        t({'', '\t'}), i(0),
        t({'', 'end'})
    }),
    s('mf', {
        t('function '), i(1, ''), t('.'), i(2, ''), t('('), i(3, ''), t(')'),
        t({'', '\t'}), i(0),
        t({'', 'end'})
    }),
}
ls.add_snippets('lua', snippets)
