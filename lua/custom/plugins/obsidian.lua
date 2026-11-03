return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
  },
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    picker = {
      name = 'telescope.nvim',
    },
    workspaces = {
      {
        name = 'memory',
        path = '/Users/stellarc/Library/Mobile Documents/iCloud~md~obsidian/Documents/memory/',
      },
      {
        name = 'politics',
        path = '/Users/stellarc/Library/Mobile Documents/iCloud~md~obsidian/Documents/politics/',
      },
    },
    note_id_func = function(title)
      if title ~= nil and title ~= '' then
        return title
          :gsub('[/\\:*?"<>|]', '') -- remove characters invalid in filenames
          :gsub('%s+$', '') -- trim trailing spaces
      else
        return tostring(os.time())
      end
    end,
    vim.api.nvim_create_autocmd('User', {
      pattern = 'ObsidianNoteEnter',
      callback = function(ev)
        -- remove the default mappings
        -- vim.keymap.del('n', '<CR>', { buffer = true })
        -- vim.keymap.del('n', ']o', { buffer = true })
        -- vim.keymap.del('n', '[o', { buffer = true })

        -- add your own
        vim.keymap.set('n', '<leader><CR>', require('obsidian.api').smart_action, { buffer = true })
        -- vim.keymap.del('n', ']l', { buffer = true })
        -- vim.keymap.del('n', '[l', { buffer = true })
      end,
    }),
  },
}
