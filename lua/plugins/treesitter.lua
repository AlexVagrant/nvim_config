return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      -- ── 编译依赖检查 ──
      local can_compile = vim.fn.executable('tree-sitter') == 1
        and vim.fn.executable('cc') == 1

      -- nvim-treesitter v1.0: setup 只接受 install_dir
      require('nvim-treesitter').setup {
        install_dir = vim.fn.stdpath('data') .. '/site',
      }

      -- 安装所需语言解析器（依赖 tree-sitter-cli + cc）
      if can_compile then
        require('nvim-treesitter').install {
          'cpp', 'dot', 'vim', 'lua', 'rust', 'toml',
          'javascript', 'typescript', 'vue', 'scss', 'css', 'html',
        }
      end

      -- Neovim 0.12+ 原生 treesitter 折叠
      vim.o.foldmethod = 'expr'
      vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.o.foldlevelstart = 99
    end,
  },
}
