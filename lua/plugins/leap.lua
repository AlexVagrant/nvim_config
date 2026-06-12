return {
  {
    url = "https://codeberg.org/andyg/leap.nvim",
    config = function()
      local leap = require('leap')
      
      -- 设置选项
      leap.opts.on_beacons = function(targets)
        for _, t in ipairs(targets) do
          if not t.label and not t.beacon and t.chars and t.is_previewable ~= false then
            t.beacon = { 0, { virt_text = { { table.concat(t.chars), 'LeapMatch' } } }, }
          end
        end
      end
      
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