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
  s(
    {
      trig = 'motioncanvas',
      descr = 'motioncanvas examplescene boilerplate',
    },
    fmt(
      [[
import { Circle, makeScene2D } from "@motion-canvas/2d";
import { all } from "@motion-canvas/core";

export default makeScene2D(function* (view) {
	//refs

	view.fill('0e0e0e');
	view.add(
	<>
    $%
	</>
	);

});
]],
      { i(1) },
      { delimiters = '$%' }
    )
  ),
}
