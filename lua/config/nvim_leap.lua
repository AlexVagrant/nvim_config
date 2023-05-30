require('leap').add_default_mappings()

require('leap').opts.highlight_unlabeled_phase_one_targets = true

vim.keymap.set({'x', 'o', 'n'}, 'r', '<Plug>(leap-forward-to)')

vim.keymap.set({'x', 'o', 'n'}, 'R', '<Plug>(leap-backward-to)')

require('flit').setup {
  keys = { f = 'f', F = 'F', t = 't', T = 'T' },
  -- A string like "nv", "nvo", "o", etc.
  labeled_modes = "v",
  multiline = true,
  -- Like `leap`s similar argument (call-specific overrides).
  -- E.g.: opts = { equivalence_classes = {} }
  opts = {}
}
