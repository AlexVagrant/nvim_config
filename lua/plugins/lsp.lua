return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'WhoIsSethDaniel/mason-tool-installer.nvim', config = function()
        require("mason-tool-installer").setup({
          auto_update = true,
        })
      end },
    },
    config = function()
      -- 0.12+ vim.lsp.set_log_level 已废弃，日志级别通过 vim.lsp.log.LEVEL 设置
      vim.lsp.log.LEVEL = vim.log.levels.ERROR

      -- 仅保留非内置的键映射（0.11+ 已内置: grn, grr, gri, gra, gO, grt, grx, Ctrl-S, [d, ]d）
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
      vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

      local on_attach = function(args)
        local bufnr = args.buf
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        -- 以下映射尚未内置，需手动设置
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = on_attach,
      })

      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",
          "yamlls",
          "cssls",
          "html",
          "lua_ls",
          "rust_analyzer",
          "vtsls",
          "vue_ls",
          "eslint",
          "tailwindcss",
          "jsonls",
          "pylsp"
        },
        automatic_installation = true,
      })

      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              },
            },
          },
        },
      })

      local vue_language_server_path = vim.fn.stdpath('data') .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
      local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
      local vue_plugin = {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
        configNamespace = 'typescript',
      }
      local vtsls_config = {
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                vue_plugin,
              },
            },
          },
        },
        filetypes = tsserver_filetypes,
      }

      vim.lsp.config('vtsls', vtsls_config)
      vim.lsp.enable({'vtsls', 'vue_ls'})

      -- tailwindcss: 移除 vscode 命名 'erb'/'hbs' (nvim 中对应 eruby/handlebars, 已在列表中)
      -- 及 nvim 永远不会产生的 vscode 专有 filetype (aspnetcorerazor/astro-markdown/django-html/html-eex/reason),
      -- 其余与 lspconfig 默认列表一致, 消除 checkhealth 的 Unknown filetype 警告
      vim.lsp.config('tailwindcss', { filetypes = {
        'astro', 'blade', 'clojure', 'htmldjango', 'edge', 'eelixir', 'elixir', 'ejs',
        'eruby', 'gohtml', 'gohtmltmpl', 'haml', 'handlebars', 'html', 'htmlangular',
        'heex', 'jade', 'leaf', 'liquid', 'markdown', 'mdx', 'mustache', 'njk', 'nunjucks',
        'php', 'razor', 'slim', 'twig', 'css', 'less', 'postcss', 'sass', 'scss', 'stylus',
        'sugarss', 'javascript', 'javascriptreact', 'rescript', 'typescript',
        'typescriptreact', 'vue', 'svelte', 'templ',
      } })
      vim.lsp.enable('tailwindcss')

      -- clangd: 移除 c.doxygen/cpp.doxygen (nvim 不会自动产生, 仅在手动 setfiletype 时生效)
      vim.lsp.config('clangd', { filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' } })

      vim.lsp.config("eslint", {
        on_attach = function(client, bufnr)
          vim.api.nvim_create_user_command("EslintFixAll", function()
            vim.lsp.buf.execute_command({
              command = "eslint.applyAllFixes",
              arguments = { { uri = vim.uri_from_bufnr(bufnr) } },
            })
          end, {})
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })
      vim.lsp.enable('eslint')

      vim.lsp.enable('jsonls')
      vim.lsp.enable('tailwindcss')
      vim.lsp.enable('pylsp')
    end
  }
}
