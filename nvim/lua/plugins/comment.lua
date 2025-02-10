-- Easily comment visual regions/lines
return {
  'numToStr/Comment.nvim',
  opts = {},
  config = function()
    require('Comment').setup {
      -- Use line comments by default
      opleader = {
        line = 'gc', -- `gcc` for single-line comment toggle
      },
    }
    local opts = { noremap = true, silent = true }
    -- vim.keymap.set('n', '<C-c>', require('Comment.api').toggle.linewise.current, opts)
    -- vim.keymap.set('n', '<C-/>', require('Comment.api').toggle.linewise.current, opts)
    -- vim.keymap.set('n', '<gcc>', require('Comment.api').toggle.linewise.current, opts)
    -- vim.keymap.set('v', '<C-c>', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
    -- vim.keymap.set('v', '<C-/>', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
    -- vim.keymap.set('v', '<gcc>', "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", opts)
  end,
}
