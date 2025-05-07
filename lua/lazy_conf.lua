local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  {
    'nvim-lua/plenary.nvim',
  },
  ------------------ 弹窗窗口 -----------------
  {
    'rcarriga/nvim-notify',
  },
  {
    "folke/noice.nvim",
      enabled = true,
      lazy = true,
      event = { "BufRead", "BufNewFile" },
      dependencies = { "rcarriga/nvim-notify", "MunifTanjim/nui.nvim" },
  },
  {
    'MunifTanjim/nui.nvim',
  },
  ------------------ 图标 -----------------
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    'goolord/alpha-nvim',
  },
  ------------------ 主题 -----------------
  {
    'tanvirtin/monokai.nvim',
  },
  {
    "polirritmico/monokai-nightasty.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    'folke/tokyonight.nvim',
  },
  {
    'olimorris/onedarkpro.nvim'
  },
  {
    'sainnhe/sonokai'
  },
  {
    'Mofiqul/vscode.nvim'
  },
  {
    'Mofiqul/dracula.nvim'
  },
  {
    "zootedb0t/citruszest.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },

  ------------------ telescope -----------------
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    -- or                            , branch = '0.1.x',
  },
  { "nvim-telescope/telescope-live-grep-args.nvim", },
  { "nvim-telescope/telescope-live-grep-raw.nvim", },
  { "LinArcX/telescope-env.nvim", },
  { "nvim-telescope/telescope-ui-select.nvim", },
  { "nvim-telescope/telescope-rg.nvim", },
  { "nvim-telescope/telescope-dap.nvim", },
  { 'neovim/nvim-lspconfig' },

  ------------------ nvim-treesitter -----------------
  {
    'nvim-treesitter/nvim-treesitter',
     dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
     },
     build = ':TSUpdate',
  },
  {
    "RRethy/nvim-treesitter-textsubjects",
    lazy = true,
    event = { "User FileOpened" },
    after = "nvim-treesitter",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },


  -- Core package manager – last 1.x commit (May 2 2025)
  { "williamboman/mason.nvim", commit = "4da89f3" }, -- v1.‑series
    -- LSP bridge – latest 1.x release tag (Feb 15 2025)
  { "williamboman/mason-lspconfig.nvim", commit = "1a31f82" }, -- v1.32.0


  ------------------ rust-toos.nvim -----------------
  {'simrat39/rust-tools.nvim'},
  ------------------ Debugging -----------------
  {'mfussenegger/nvim-dap'},
  ------------------ nvim-tree -----------------
  {
    'nvim-tree/nvim-tree.lua'
  },
  ------------------ Snippet engine and snippet template -----------------
  { "SirVer/ultisnips" },

  { "onsails/lspkind-nvim" },
  ------------------ auto-completion engine -----------------
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "luckasRanarison/tailwind-tools.nvim",
      "onsails/lspkind-nvim",
    },
  },
  ------------------ nvim-cmp completion sources -----------------
  { "hrsh7th/cmp-vsnip" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-omni" },
  -- { "quangnguyen30192/cmp-nvim-ultisnips" },
  { "hrsh7th/cmp-emoji", enabled = vim.g.is_mac  },

  ------------------ lspkind icon -----------------
  {'mortepau/codicons.nvim'},
  -- {'akinsho/bufferline.nvim', version = "v3.*", dependencies = 'nvim-tree/nvim-web-devicons'},
  {'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },
  ------------------ git -----------------
  {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  },
  {
      "kdheepak/lazygit.nvim",
      -- optional for floating window border decoration
      dependencies = {
          "nvim-lua/plenary.nvim",
      }
  },
  ------------------ new plug -----------------
  
  ------------------ taglist -----------------
  {
    "simrat39/symbols-outline.nvim",
    config=true,
    lazy = true,
    cmd = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
  },
  ------------------ 全局搜索插件 Ack -----------------
  { 'wincent/ferret' },
  { 'junegunn/fzf' },
  { 'junegunn/fzf.vim' },
  
  ------------------ 改变包围结构插件 -----------------
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },

  ------------------ 快速跳转插件 -----------------
  {
    "ggandor/leap.nvim",
    lazy = true,
    event = "BufReadPost",
  },
  {
    "ggandor/flit.nvim",
    lazy = true,
    event = "BufReadPost",
  },
  {
    "tpope/vim-repeat",
    lazy = true,
    keys = ".",
  },
  ------------------ 注释插件 -----------------
  {
    'numToStr/Comment.nvim',
    lazy = true,
  },
  ------------------ 刷题插件 -----------------
  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
  },
  ------------------ css color -----------------
  {
    'norcalli/nvim-colorizer.lua'
  },

  ------------------ 缩进线 -----------------
  { "lukas-reineke/indent-blankline.nvim" },

  ------------------ markdonw预览 -----------------
  {
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  ------------------ lsp-format -----------------
  { "lukas-reineke/lsp-format.nvim" },

  { "JoosepAlviste/nvim-ts-context-commentstring", commit = "6c30f3c8915d7b31c3decdfe6c7672432da1809d" },

  ------------------ hlargs.nvim -----------------
  { 'm-demare/hlargs.nvim' },
  ------------------ tailwind-tools.nvim -----------------
  {
    "luckasRanarison/tailwind-tools.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {} -- your configuration
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
})
