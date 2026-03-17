return {
  -- 1. LSP: The "Roslyn" approach
  {
    'seblyng/roslyn.nvim',
    ft = 'cs',
    dependencies = {
      -- Required to install the roslyn server easily
      {
        'williamboman/mason.nvim',
        opts = {
          registries = {
            'github:mason-org/mason-registry',
            'github:Crashdummyy/mason-registry', -- Needed for Roslyn
          },
        },
      },
    },
    config = function()
      require('roslyn').setup {
        args = {
          '--logLevel=Information',
          '--extensionLogDirectory=' .. vim.fs.dirname(vim.lsp.get_log_path()),
          '--stdio',
        },
        config = {
          -- Roslyn-specific settings (like formatting or analyzers)
          settings = {
            ['csharp|background_analysis'] = {
              dotnet_compiler_diagnostics_scope = 'fullSolution',
            },
          },
        },
      }
    end,
  },
}
