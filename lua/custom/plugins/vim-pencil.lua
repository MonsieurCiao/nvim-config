return {
  'preservim/vim-pencil',
  init = function()
    vim.g['pencil#wrapModeDefault'] = 'soft'
    vim.g['pencil#conceallevel'] = 1
  end,
}
