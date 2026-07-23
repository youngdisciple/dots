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

    -- numeric for loop: for i = 1, 10 do ... end
    s('forn', {
        t('for '), i(1, 'i'), t(' = '), i(2, '1'), t(', '), i(3, '10'), t(' do'),
        t({'', '\t'}), i(0),
        t({'', 'end'})
    }),

    -- generic for-in loop: for k, v in someTable do ... end
    s('forin', {
        t('for '), i(1, 'k'), t(', '), i(2, 'v'), t(' in '), i(3, 'table'), t(' do'),
        t({'', '\t'}), i(0),
        t({'', 'end'})
    }),

    -- ipairs loop
    s('fori', {
        t('for '), i(1, 'index'), t(', '), i(2, 'value'), t(' in ipairs('), i(3, 'table'), t(') do'),
        t({'', '\t'}), i(0),
        t({'', 'end'})
    }),

    -- pairs loop
    s('forp', {
        t('for '), i(1, 'key'), t(', '), i(2, 'value'), t(' in pairs('), i(3, 'table'), t(') do'),
        t({'', '\t'}), i(0),
        t({'', 'end'})
    }),

    -- if statement
    s('if', {
        t('if '), i(1, 'condition'), t(' then'),
        t({'', '\t'}), i(0),
        t({'', 'end'})
    }),

    -- if/else
    s('ife', {
        t('if '), i(1, 'condition'), t(' then'),
        t({'', '\t'}), i(2),
        t({'', 'else'}),
        t({'', '\t'}), i(0),
        t({'', 'end'})
    }),

    -- if/elseif/else
    s('ifee', {
        t('if '), i(1, 'condition'), t(' then'),
        t({'', '\t'}), i(2),
        t({'', 'elseif '}), i(3, 'condition'), t(' then'),
        t({'', '\t'}), i(4),
        t({'', 'else'}),
        t({'', '\t'}), i(0),
        t({'', 'end'})
    }),

    -- while loop
    s('wh', {
        t('while '), i(1, 'condition'), t(' do'),
        t({'', '\t'}), i(0),
        t({'', 'end'})
    }),

    -- repeat/until
    s('rep', {
        t('repeat'),
        t({'', '\t'}), i(0),
        t({'', 'until '}), i(1, 'condition')
    }),

    -- table literal
    s('tbl', {
        t('local '), i(1, 'tableName'), t(' = {'),
        t({'', '\t'}), i(0),
        t({'', '}'})
    }),

    -- anonymous function
    s('fun', {
        t('function('), i(1, ''), t(')'),
        t({'', '\t'}), i(0),
        t({'', 'end'})
    }),
    s('storyfile', {
        t('local Packages = game:GetService("ReplicatedStorage").Packages'),
        t({'', 'local React = require(Packages:WaitForChild("react"))'}),
        t({'', 'local ReactRoblox = require(Packages:WaitForChild("react-roblox"))'}),
        t({'', 'local '}), i(1, 'Home'), t(' = require(script.Parent:WaitForChild("'),
        d(2, function(args)
            return sn(nil, { i(1, args[1][1]) })
        end, { 1 }),
        t('"))'),
        t({'', 'local controls = {}'}),
        t({'', 'local story = {'}),
        t({'', '\treact = React,'}),
        t({'', '\treactRoblox = ReactRoblox,'}),
        t({'', '\tcontrols = controls,'}),
        t({'', '\tstory = '}),
        d(3, function(args)
            return sn(nil, { i(1, args[1][1]) })
        end, { 1 }),
        t(','),
        t({'', '}'}),
        t({'', 'return story'}),
    }),
}


ls.add_snippets('lua', snippets)
