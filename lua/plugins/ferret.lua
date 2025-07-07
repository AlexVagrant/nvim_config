return {
  'wincent/ferret',
  config = function ()
    vim.keymap.set('n', '<Leader>x', '<Plug>(FerretAck)', {desc = '全局替换'})
    vim.keymap.set('n', '<Leader>z', '<Plug>(FerretAckWord)', {desc = '全局替换光标下单词'})
  end
}