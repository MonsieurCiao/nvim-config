local M = {}

---Return true when the cursor is inside a `$ ... $` Typst math expression.
---This deliberately returns false while Tree-sitter is unavailable so that
---math-only autosnippets never expand in regular text.
function M.in_mathzone()
  if vim.bo.filetype ~= 'typst' then
    return false
  end

  local ok, parser = pcall(vim.treesitter.get_parser, 0, 'typst')
  if not ok then
    return false
  end

  local cursor = vim.api.nvim_win_get_cursor(0)
  local row, col = cursor[1] - 1, cursor[2]
  for _, tree in ipairs(parser:parse()) do
    local node = tree:root():named_descendant_for_range(row, col, row, col)
    while node do
      if node:type() == 'math' then
        return true
      end
      node = node:parent()
    end
  end

  return false
end

M.math_only = {
  condition = M.in_mathzone,
  show_condition = M.in_mathzone,
}

return M
