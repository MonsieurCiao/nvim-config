local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local i = ls.insert_node
return {
  s(
    'doc',
    fmt(
      [[
#set page(
  header: context [ Lukas Chao #h(1fr)
    #datetime.today().display("[year]-[month]-[day]")
  ],
  numbering: "1",
)
#set heading(numbering: "1.")
#set text(font: "New Computer Modern", size: 12pt)
#set document(title: "{}", author: "{}")

= {}

{}
]],
      { i(1, 'Title'), i(2, 'L. Chao'), i(3, 'Title'), i(0) }
    )
  ),
}
