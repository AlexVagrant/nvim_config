
return {
  "simrat39/symbols-outline.nvim",
  config = function ()
    vim.keymap.set('n', '<leader>tt', ':SymbolsOutline<CR>', {noremap = true, silent = true})
  end,
}
