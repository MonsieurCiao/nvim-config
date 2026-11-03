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

return {

  s('em', fmt('_{}_', { i(1, 'emphasized text') })),
  s('strong', fmt('*{}*', { i(1, 'strong text') })),

  s('math', fmt('${}$', { i(1) })),

  s('ref', fmt('@{}', { i(1, 'label') })),
  s('label', { t '<', i(1, 'label'), t '>' }),
  s('cite', fmt('@{}', { i(1, 'citation-key') })),
  s('link', fmt('#link("{}")[{}]', { i(1, 'https://example.com'), i(2, 'link text') })),

  s('img', fmt('#image("{}", width: {}%)', { i(1, 'image.png'), i(2, '80') })),
  s(
    'fig',
    fmt('#figure(image("{}", width: {}%), caption: [{}])', {
      i(1, 'image.png'),
      i(2, '80'),
      i(3, 'Caption'),
    })
  ),
  s(
    'table',
    fmt('#table(\n  columns: {},\n  [{}], [{}],\n  [{}], [{}],\n)', {
      i(1, '2'),
      i(2, 'Header 1'),
      i(3, 'Header 2'),
      i(4, 'Cell 1'),
      i(0, 'Cell 2'),
    })
  ),

  s('align', fmt('#align({})[\n  {}\n]', { i(1, 'center'), i(0) })),
}
