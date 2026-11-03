return {
  'L3MON4D3/LuaSnip',
  version = 'v2.*',
  build = 'make install_jsregexp',
  event = 'InsertEnter',
  config = function()
    require('luasnip.loaders.from_lua').lazy_load { paths = './lua/custom/luasnip/' }
    local ls = require 'luasnip'
    -- ls.filetype_extend('typescriptreact', { 'typescript' })
    ls.filetype_extend('cs', { 'unity' })
    require('luasnip.loaders.from_vscode').lazy_load()
    ls.setup {
      update_events = { 'TextChanged', 'TextChangedI' },
      enable_autosnippets = true,
      store_selection_keys = '<Tab>',
    }
    vim.keymap.set({ 'i' }, '<C-k>>', function()
      ls.expand()
    end, { silent = true, desc = 'expand autocomoplete' })
    vim.keymap.set({ 'i', 's' }, '<C-l>', function()
      ls.jump(1)
    end, { silent = true, desc = 'next autocomplete' })
    vim.keymap.set({ 'i', 's' }, '<C-h>', function()
      ls.jump(-1)
    end, { silent = true, desc = 'previous autocomplete' })
    vim.keymap.set({ 'i', 's' }, '<C-E>', function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true, desc = 'select autocomplete' })
  end,
}
