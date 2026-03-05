return {
  'chrisbra/csv.vim',
  -- 1. Specify the filetypes it should load for
  ft = { 'csv', 'tsv', 'dat' }, -- 'dat' for generic delimited files

  -- 2. Configuration (optional)
  init = function()
    -- **Recommended Configuration for Better Viewing**

    -- Sets the default alignment for columns: 'l' (left), 'r' (right), 'c' (center)
    -- 'l' is good for text, 'r' is good for numbers.
    -- If you want all columns aligned left:
    vim.g.csv_delim_align = 'l'

    -- Sets the default delimiter to auto-detect from a common list.
    -- If you often use a specific one, you can set it here:
    -- vim.g.csv_delim_char = ','

    -- Highlights the current column (useful for sorting/filtering)
    -- 1 = highlight current column
    vim.g.csv_highlight_column = 1

    -- Optional: Make sure the filetype is set correctly
    vim.cmd [[
      augroup CsvAutocmds
        autocmd!
        autocmd BufRead,BufNewFile *.{csv,tsv,dat} set filetype=csv
      augroup END
    ]]
  end,
}
