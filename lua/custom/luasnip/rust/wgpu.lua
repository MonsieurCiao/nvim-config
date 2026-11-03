local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

return {
  s({ trig = 'tawm', descr = 'target_arch = wasm32' }, { t '#[cfg(target_arch = "wasm32")]' }),
  s({ trig = 'aum', descr = 'allow unused mut' }, { t '#[allow(unused_mut)]' }),
  s({ trig = 'ntawm', descr = 'not target arch wasm32' }, { t '#[cfg(not(target_arch = "wasm32"))]' }),
}
