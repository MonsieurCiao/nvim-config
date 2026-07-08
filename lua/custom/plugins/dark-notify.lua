return {
  'f-person/auto-dark-mode.nvim',
  opts = {
    update_interval = 1000,
    set_dark_mode = function()
      vim.cmd 'colorscheme tokyonight' -- replace with your dark theme
    end,
    set_light_mode = function()
      vim.cmd 'colorscheme tokyonight-day' -- replace with your light theme
    end,
  },
}
