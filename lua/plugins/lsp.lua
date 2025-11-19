return {
  {
    -- 使用 Mason 来管理 LSP 服务器安装
    "williamboman/mason.nvim",
    commit = "4da89f3",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason-lspconfig.nvim", commit = "1a31f82" },
    },
    config = function()
      -- 全局键位绑定
      local opts = { noremap = true, silent = true }
      local keymap = vim.keymap
      vim.lsp.set_log_level("error")
      keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
      keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

      -- LSP 附加回调函数，用于设置缓冲区相关的键位绑定
      local on_attach = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
        keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
        keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
        keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
      end

      -- 为所有 LSP 服务器设置通用的 LspAttach 自动命令
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = on_attach,
      })

      -- 初始化 Mason
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
          "volar",
          "eslint",
          "tailwindcss",
          "jsonls"
        },
        automatic_installation = true,
      })

      -- 配置 lua_ls（Lua 语言服务器）
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

      -- nvim 0.11 or above
      vim.lsp.config('vtsls', vtsls_config)
      vim.lsp.enable({'vtsls', 'vue_ls'}) -- If using `ts_ls` replace `vtsls` to `ts_ls`

      local base_on_attach = vim.lsp.config.eslint.on_attach
      vim.lsp.config("eslint", {
        on_attach = function(client, bufnr)
          if not base_on_attach then return end

          base_on_attach(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "LspEslintFixAll",
          })
        end,
      })

      vim.lsp.enable('jsonls')
      vim.lsp.enable('tailwindcss')

      -- 使用 mason-lspconfig 的处理器来自动启用所有已安装的服务器
      require("mason-lspconfig").setup_handlers({
        -- 默认处理器：为所有服务器启用 LSP
        function(server_name)
          -- rust_analyzer 由 rustaceanvim 管理，跳过
          if server_name ~= "rust_analyzer" then
            vim.lsp.enable(server_name)
          end
        end,
      })
    end
  }
}
