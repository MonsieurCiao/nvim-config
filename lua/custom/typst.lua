local running = {}
local queued = {}
local missing_typst_notified = {}

local function open_in_skim(pdf)
  -- Skim watches an already-open PDF for changes. `-g` keeps Neovim focused
  -- when opening the PDF for the first time.
  vim.system { 'open', '-g', '-a', 'Skim', pdf }
end

local function compile(bufnr)
  local source = vim.api.nvim_buf_get_name(bufnr)
  if source == '' or vim.bo[bufnr].filetype ~= 'typst' then
    return
  end

  if running[bufnr] then
    queued[bufnr] = true
    return
  end

  if vim.fn.executable 'typst' ~= 1 then
    if not missing_typst_notified[bufnr] then
      vim.notify('Typst CLI not found. Install it and ensure `typst` is on $PATH.', vim.log.levels.ERROR)
      missing_typst_notified[bufnr] = true
    end
    return
  end

  local source_dir = vim.fn.fnamemodify(source, ':h')
  local output_dir = vim.fs.joinpath(source_dir, 'out')
  if vim.fn.mkdir(output_dir, 'p') == 0 and vim.fn.isdirectory(output_dir) == 0 then
    vim.notify('Could not create Typst output directory: ' .. output_dir, vim.log.levels.ERROR)
    return
  end

  running[bufnr] = true
  local pdf = vim.fs.joinpath(output_dir, vim.fn.fnamemodify(source, ':t:r') .. '.pdf')
  vim.system({ 'typst', 'compile', source, pdf }, { cwd = source_dir, text = true }, function(result)
    vim.schedule(function()
      running[bufnr] = nil

      if result.code == 0 then
        open_in_skim(pdf)
      else
        vim.notify(result.stderr ~= '' and result.stderr or 'Typst compilation failed.', vim.log.levels.ERROR)
      end

      if queued[bufnr] and vim.api.nvim_buf_is_valid(bufnr) then
        queued[bufnr] = nil
        compile(bufnr)
      end
    end)
  end)
end

vim.api.nvim_create_user_command('TypstCompile', function()
  compile(vim.api.nvim_get_current_buf())
end, { desc = 'Compile the current Typst file and open it in Skim', force = true })

vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('typst-compile-on-save', { clear = true }),
  pattern = '*.typ',
  callback = function(event)
    compile(event.buf)
  end,
})
