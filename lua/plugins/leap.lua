return {
  {
    "ggandor/leap.nvim",
    config = function()
      local leap = require('leap')
      
      -- 设置选项
      leap.opts.highlight_unlabeled_phase_one_targets = true
      
      -- 设置默认键映射
      vim.keymap.set({'x', 'o', 'n'}, 's', '<Plug>(leap-forward-to)', {desc = 'Leap向前'})
      vim.keymap.set({'x', 'o', 'n'}, 'S', '<Plug>(leap-backward-to)', {desc = 'Leap向后'})
      vim.keymap.set({'x', 'o', 'n'}, 'gs', '<Plug>(leap-from-window)', {desc = 'Leap跨窗口'})
    end
  },
  {
    "ggandor/flit.nvim",
    config = function()
      require('flit').setup {
        keys = { f = 'f', F = 'F', t = 't', T = 'T' },
        labeled_modes = "v",
        multiline = true,
        opts = {}
      }
    end
  },
  {
    "tpope/vim-repeat",
  },
}