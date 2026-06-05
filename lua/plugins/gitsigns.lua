return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text_pos = 'eol',
        delay = 1000,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    }
  end
}
