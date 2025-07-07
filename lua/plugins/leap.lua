return {
  {
    "ggandor/leap.nvim",
    config = function()
      require('leap').add_default_mappings()
      require('leap').opts.highlight_unlabeled_phase_one_targets = true
      vim.keymap.set({'x', 'o', 'n'}, 's', '<Plug>(leap-forward-to)', {desc = 'Leap向前'})
      vim.keymap.set({'x', 'o', 'n'}, 'S', '<Plug>(leap-backward-to)', {desc = 'Leap向后'})
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