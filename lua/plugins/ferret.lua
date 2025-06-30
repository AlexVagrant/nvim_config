
return {
  'wincent/ferret',
  config = function ()
    vim.keymap.set('n', '<Leader>x', '<Plug>(FerretAck)', {})
    vim.keymap.set('n', '<Leader>z', '<Plug>(FerretAckWord)', {})
  end
}
