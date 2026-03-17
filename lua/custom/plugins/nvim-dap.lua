return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'rcarriga/nvim-dap-ui',
    {
      'ownself/nvim-dap-unity',
      build = function()
        require('nvim-dap-unity').install()
      end,
    },
  },
  config = function()
    local dap = require 'dap'
    dap.configurations.cs = dap.configurations.cs or {}
    -- Add Unity attach config (extend existing)
    vim.list_extend(dap.configurations.cs, {
      {
        name = 'Unity Debugger',
        type = 'coreclr',
        request = 'attach',
        program = function()
          return vim.fn.input('Path to Unity exe or pid', vim.fn.getcwd(), 'file')
        end,
      },
    })
  end,
}
