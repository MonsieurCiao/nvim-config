-- Abbreviations used in this article and the LuaSnip docs
local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require 'luasnip.util.events'
local ai = require 'luasnip.nodes.absolute_indexer'
local extras = require 'luasnip.extras'
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local conds = require 'luasnip.extras.expand_conditions'
local postfix = require('luasnip.extras.postfix').postfix
local types = require 'luasnip.util.types'
local parse = require('luasnip.util.parser').parse_snippet
local ms = ls.multi_snippet
local k = require('luasnip.nodes.key_indexer').new_key
local math_only = require('custom.typst_snippets').math_only

return {
  s({ trig = '*', snippetType = 'autosnippet', wordTrig = false }, {
    t 'dot',
  }, math_only),

  s({ trig = 'inf', snippetType = 'autosnippet', wordTrig = false }, {
    t 'infinity',
  }, math_only),

  s({ trig = 'ff', snippetType = 'autosnippet', wordTrig = false }, fmt('frac({}, {})', { i(1), i(2) }), math_only),

  s({ trig = 'sum', snippetType = 'autosnippet', wordTrig = false }, fmt('sum_({})^({}){}', { i(1), i(2), i(3) }), math_only),

  s({ trig = 'lim', snippetType = 'autosnippet', wordTrig = false }, fmt('lim_({}){}', { i(1), i(2) }), math_only),

  s({ trig = 'dint', snippetType = 'autosnippet', wordTrig = false }, fmt('int_({})^({}){}d{}', { i(1), i(2), i(3), i(4) }), math_only),

  s({ trig = 'int', snippetType = 'autosnippet', wordTrig = false }, fmt('int_()^(){}d{}', { i(1), i(2) }), math_only),
}
