local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local i = ls.insert_node

return {
  s(
    'h1',
    fmt(
      [[
= {}
{}
]],
      { i(1, 'Heading'), i(2) }
    )
  ),

  s(
    'h2',
    fmt(
      [[
= {}
{}
]],
      { i(1, 'Heading'), i(2) }
    )
  ),
  s(
    'h3',
    fmt(
      [[
= {}
{}
]],
      { i(1, 'Heading'), i(2) }
    )
  ),
}
