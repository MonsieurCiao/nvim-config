return {
  'B1gum/Tungsten',
  ft = 'tex',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim', -- Optional
    'folke/which-key.nvim', -- Optional
  },
  build = './scripts/install_python_deps.sh', -- This automates the packaging!
  opts = {
    -- Configuration options
  },
}
