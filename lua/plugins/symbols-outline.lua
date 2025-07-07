return {
  "simrat39/symbols-outline.nvim",
  config = function ()
    require('symbols-outline').setup()
    vim.keymap.set('n', '<leader>tt', '<cmd>SymbolsOutline<cr>', { desc = '显示符号大纲' })
  end,
}