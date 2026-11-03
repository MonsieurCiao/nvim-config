-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {},
  config = function()
    local npairs = require 'nvim-autopairs'
    local Rule = require 'nvim-autopairs.rule'
    local cond = require 'nvim-autopairs.conds'
    npairs.setup {}
    npairs.add_rule(Rule("'", "'"):with_pair(function(opts)
      local disabled = {
        markdown = true,
        scheme = true,
        rust = true,
      }
      return not disabled[vim.bo.filetype]
    end))
    npairs.add_rule(Rule('$', '$', 'typst'))
  end,
}
