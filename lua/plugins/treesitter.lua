return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      "RRethy/nvim-treesitter-textsubjects",
    },
    build = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "cpp", "dot", "vim", "lua", "rust", "toml", "javascript", "typescript", "vue", "scss", "css", "html" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        ident = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
            scope_incremental = '<TAB>',
          }
        },
        textsubjects = {
          enable = true,
          prev_selection = ",",
          keymaps = {
            ["."] = "textsubjects-smart",
            [";"] = "textsubjects-container-outer",
            ["i;"] = "textsubjects-container-inner",
          },
        },
      }

      -- Neovim 0.12+ 原生 treesitter 折叠
      vim.o.foldmethod = 'expr'
      vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      vim.o.foldlevelstart = 99
    end
  },
}
